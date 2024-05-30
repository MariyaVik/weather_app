import 'package:shared_preferences/shared_preferences.dart';
import 'package:jwt_decoder/jwt_decoder.dart';
import '../../cubit/auth_state.dart';
import '../models/user_model.dart';
import 'mok.dart';

class AuthRepository {
  final SharedPreferences _sharedPreferences;

  AuthRepository(this._sharedPreferences);

  static const String _accessTokenKey = 'access_token';

  Future<AuthState> login(String username, String password) async {
    try {
      // тут должно быть обращение к серверу
      await Future.delayed(const Duration(milliseconds: 700));
      final foundUser = mokUsers.firstWhere(
        (element) => element['login'] == username,
        orElse: () => {},
      );
      if (foundUser.isNotEmpty) {
        if (foundUser['password'] == password) {
          final accessToken = foundUser['access_token'] ?? '';

          await _saveAuthData(accessToken);

          final user = _decodeToken(accessToken);
          return AuthState.authenticated(user: user);
        } else {
          return const AuthState.error(error: 'Неверный пароль');
        }
      } else {
        return const AuthState.error(
            error: 'Такого пользователя не существует');
      }
    } catch (e) {
      return AuthState.error(error: e.toString());
    }
  }

  Future<void> logout() async {
    await _clearAuthData();
  }

  Future<AuthState> checkAuthStatus() async {
    final accessToken = _sharedPreferences.getString(_accessTokenKey);

    if (accessToken != null) {
      final user = _decodeToken(accessToken);
      return AuthState.authenticated(user: user);
    } else {
      return const AuthState.unauthenticated();
    }
  }

  Future<String?> getAccessToken() async {
    return _sharedPreferences.getString(_accessTokenKey);
  }

  Future<void> _saveAuthData(String accessToken) async {
    await _sharedPreferences.setString(_accessTokenKey, accessToken);
  }

  Future<void> _clearAuthData() async {
    await _sharedPreferences.remove(_accessTokenKey);
  }

  UserModel _decodeToken(String token) {
    final decodedToken = JwtDecoder.decode(token);
    return UserModel.fromJson(decodedToken);
  }
}
