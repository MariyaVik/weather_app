import 'package:flutter_bloc/flutter_bloc.dart';

import '../data/repositories/auth_repository.dart';
import 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  final AuthRepository authRepository;

  AuthCubit({required this.authRepository}) : super(const AuthInitial());

  Future<void> checkAuthStatus() async {
    emit(const AuthState.loading());

    final result = await authRepository.checkAuthStatus();

    if (result is AuthUnauthenticated) {
      final newResult = await authRepository.checkAuthStatus();
      emit(newResult);
    } else {
      emit(result);
    }
  }

  Future<void> login(String username, String password) async {
    emit(const AuthLoading());
    try {
      final result = await authRepository.login(username, password);
      emit(result);
    } catch (error) {
      emit(AuthError(error: error.toString()));
    }
  }

  Future<void> logout() async {
    await authRepository.logout();
    emit(const AuthUnauthenticated());
  }
}
