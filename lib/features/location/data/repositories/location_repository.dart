import 'package:geolocator/geolocator.dart';

import '../../../../common/logger.dart';
import '../../../../common/utils/dio_client.dart';
import '../models/location.dart';

class LocationRepository {
  final DioClient dioClient;

  LocationRepository(this.dioClient);

  Future<Position> getCurrentLocation() async {
    bool serviceEnabled;
    LocationPermission permission;

    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      throw Exception('Определение местоположения отключено');
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        throw Exception('Разрешение на определение местоположения отсутствует');
      }
    }

    if (permission == LocationPermission.deniedForever) {
      throw Exception('Определение местоположения запрещено навсегда');
    }

    return await Geolocator.getCurrentPosition(
      desiredAccuracy: LocationAccuracy.high,
    );
  }

  Future<Location> getCoordinatesByCityName(String cityName) async {
    try {
      final response = await dioClient.get(
        '/geo/1.0/direct',
        queryParameters: {
          'q': cityName,
          'limit': 1,
        },
      );
      if (response.data.isNotEmpty) {
        return Location.fromJson(response.data[0]);
      } else {
        throw Exception('Координаты не найдены');
      }
    } catch (e) {
      logger.e(e);
      rethrow;
    }
  }

  Future<String?> getCityByCoordinates(
      double latitude, double longitude) async {
    try {
      final response =
          await dioClient.get('/geo/1.0/reverse', queryParameters: {
        'lat': latitude,
        'lon': longitude,
        'limit': 1,
      });

      if (response.data != null && response.data.isNotEmpty) {
        return response.data[0]['name'];
      }
    } catch (e) {
      logger.e(e);
      throw Exception(e);
    }
    return null;
  }
}
