abstract class AppCache {
  Future<void> saveUser(String token);
  String? getUser();
  Future<void> clearUser();
  Future<void> saveSelectedCity(String city);
  String? getSelectedCity();
}
