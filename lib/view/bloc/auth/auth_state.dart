part of 'auth_cubit.dart';

@freezed
class AuthState with _$AuthState {
  const factory AuthState({
    String? authToken,
    @Default(false) bool loading,
    Exception? exception,
  }) = _AuthState;
}
