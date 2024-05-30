import 'package:freezed_annotation/freezed_annotation.dart';
import '../data/models/user_model.dart';

part '../../../generated/features/auth/cubit/auth_state.freezed.dart';

@freezed
class AuthState with _$AuthState {
  const factory AuthState.initial() = AuthInitial;
  const factory AuthState.loading() = AuthLoading;
  const factory AuthState.authenticated({required UserModel user}) =
      AuthAuthenticated;
  const factory AuthState.unauthenticated() = AuthUnauthenticated;
  const factory AuthState.error({required String error}) = AuthError;
}
