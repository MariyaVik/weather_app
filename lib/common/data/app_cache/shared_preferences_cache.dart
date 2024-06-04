import 'package:shared_preferences/shared_preferences.dart';
import 'package:weather_app/common/data/app_cache/app_cache.dart';

class SharedPreferencesCache implements AppCache {
  final SharedPreferences prefs;

  SharedPreferencesCache(this.prefs);

  static const String _accessTokenKey = 'access_token';
  static const String _selectedCityKey = 'selected_city';

  @override
  String? getUser() {
    return prefs.getString(_accessTokenKey);
  }

  @override
  Future<void> saveUser(String token) async {
    await prefs.setString(_accessTokenKey, token);
  }

  @override
  Future<void> clearUser() async {
    await prefs.remove(_accessTokenKey);
  }

  @override
  String? getSelectedCity() {
    return prefs.getString(_selectedCityKey);
  }

  @override
  Future<void> saveSelectedCity(String city) async {
    await prefs.setString(_selectedCityKey, city);
  }
}
