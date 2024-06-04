import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:weather_app/common/data/app_cache/app_cache.dart';
import 'package:weather_app/common/utils/dio_client.dart';

import '../features/auth/data/repositories/auth_repository.dart';
import '../features/weather/data/repositories/weather_repository.dart';
import '../features/location/data/repositories/location_repository.dart';
import 'data/app_cache/shared_preferences_cache.dart';

class ServiceLocator {
  ServiceLocator._();
  static final instance = ServiceLocator._();

  final _locator = GetIt.instance;

  AuthRepository get authRepository => _locator<AuthRepository>();
  WeatherRepository get weatherRepository => _locator<WeatherRepository>();
  LocationRepository get locationRepository => _locator<LocationRepository>();
  AppCache get appCache => _locator<AppCache>();

  Future<void> init() async {
    final sharedPreferences = await SharedPreferences.getInstance();

    final SharedPreferencesCache appCache =
        SharedPreferencesCache(sharedPreferences);
    _locator.registerSingleton<AppCache>(appCache);

    final authRepository = AuthRepository(appCache);
    _locator.registerSingleton<AuthRepository>(authRepository);

    final dioClientWeather = DioClient(
        baseUrl: 'https://api.openweathermap.org',
        apiKey: '997cf43f515813051e865e0218b775aa',
        apiKeyName: 'appid');

    final locationRepository = LocationRepository(dioClientWeather);
    _locator.registerSingleton<LocationRepository>(locationRepository);

    _locator.registerSingleton(WeatherRepository(
      dioClientWeather,
      locationRepository,
    ));
  }
}
