import '../../../location/data/repositories/location_repository.dart';
import '../../../../common/logger.dart';
import '../../../../common/utils/dio_client.dart';
import '../models/weather.dart';

class WeatherRepository {
  final DioClient dioClient;
  final LocationRepository locationRepository;

  WeatherRepository(
    this.dioClient,
    this.locationRepository,
  );

  Future<Weather> getWeatherByCoordinates(double lat, double lon) async {
    try {
      final response = await dioClient.get(
        '/data/2.5/weather',
        queryParameters: {
          'lat': lat,
          'lon': lon,
          'lang': 'ru',
        },
      );
      return Weather.fromJson(response.data);
    } catch (e) {
      logger.e(e);
      rethrow;
    }
  }

  Future<Weather> getWeatherByCityName(String cityName) async {
    try {
      final location =
          await locationRepository.getCoordinatesByCityName(cityName);
      return await getWeatherByCoordinates(location.lat, location.lon);
    } catch (e) {
      logger.e(e);
      rethrow;
    }
  }
}
