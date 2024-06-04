import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/common/utils/extensions.dart';

import '../../../common/data/app_cache/app_cache.dart';
import '../data/repositories/location_repository.dart';
import 'location_state.dart';

class LocationCubit extends Cubit<LocationState> {
  final LocationRepository locationRepository;
  final AppCache appCache;

  LocationCubit(
    this.locationRepository,
    this.appCache,
  ) : super(const LocationState.cityNotSelected()) {
    _loadSelectedCity();
  }

  void selectCity(String city) async {
    emit(const LocationState.loading());
    try {
      final goodCity = city.capitalize();
      final geo = await locationRepository.getCoordinatesByCityName(goodCity);
      _saveSelectedCity(goodCity);
      emit(LocationState.loaded(selectedCity: goodCity, coordinates: geo));
    } catch (e) {
      emit(const LocationState.error('Не удалось получить координаты города'));
    }
  }

  void getCurrentCityFromLocation() async {
    emit(const LocationState.loading());
    try {
      final position = await locationRepository.getCurrentLocation();
      final city = await locationRepository.getCityByCoordinates(
          position.latitude, position.longitude);
      if (city != null) {
        selectCity(city);
      } else {
        emit(const LocationState.cityNotSelected());
      }
    } catch (e) {
      emit(const LocationState.cityNotSelected());
    }
  }

  void _loadSelectedCity() async {
    final city = appCache.getSelectedCity();
    if (city != null) {
      selectCity(city);
    } else {
      getCurrentCityFromLocation();
    }
  }

  void _saveSelectedCity(String city) async {
    await appCache.saveSelectedCity(city);
  }
}
