import '../api/auth_api.dart';

class AuthController {
  final _authApi = AuthApi();

  Future<void> googleSignIn() async {
    await _authApi.googleSignIn();
  }

  Future<void> facebookSignIn() async {
    await _authApi.facebookSignIn();
  }

  Future<void> signOut() async {
    await _authApi.signOut();
  }

  Future<String?> token() async {
    final token = await _authApi.token();

    return token;
  }
}
