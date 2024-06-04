import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/common/logger.dart';

import '../data/repositories/weather_repository.dart';
import 'weather_state.dart';

class WeatherCubit extends Cubit<WeatherState> {
  final WeatherRepository weatherRepository;

  WeatherCubit(this.weatherRepository) : super(const WeatherState.initial());

  Future<void> fetchWeatherByCityName(String cityName) async {
    emit(const WeatherState.loading());
    try {
      final weather = await weatherRepository.getWeatherByCityName(cityName);

      emit(WeatherState.loaded(weather));
    } catch (e) {
      emit(WeatherState.error(e.toString()));
    }
  }

  Future<void> fetchWeatherByCoordinates(double lat, double lon) async {
    emit(const WeatherState.loading());
    try {
      final weather = await weatherRepository.getWeatherByCoordinates(lat, lon);

      emit(WeatherState.loaded(weather));
    } catch (e) {
      logger.e(e);
      emit(WeatherState.error(e.toString()));
    }
  }
}
