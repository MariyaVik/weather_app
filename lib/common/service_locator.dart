import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../features/auth/data/repositories/auth_repository.dart';

class ServiceLocator {
  ServiceLocator._();
  static final instance = ServiceLocator._();

  final _locator = GetIt.instance;

  AuthRepository get authRepository => _locator<AuthRepository>();

  Future<void> init() async {
    final sharedPreferences = await SharedPreferences.getInstance();

    final authRepository = AuthRepository(sharedPreferences);
    _locator.registerSingleton<AuthRepository>(authRepository);
  }
}
