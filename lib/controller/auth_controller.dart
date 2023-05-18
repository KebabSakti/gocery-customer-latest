import '../api/auth_api.dart';
import '../api/firebase_api.dart';

class AuthController {
  final _authApi = AuthApi();
  final _firebaseApi = FirebaseApi();

  Future<String?> googleSignIn() async {
    String? token;

    final firebaseToken = await _firebaseApi.googleSignIn();

    if (firebaseToken != null) {
      token = await _authApi.validate(firebaseToken);
    }

    return token;
  }

  Future<String?> facebookSignIn() async {
    String? token;

    final firebaseToken = await _firebaseApi.facebookSignIn();

    if (firebaseToken != null) {
      token = await _authApi.validate(firebaseToken);
    }

    return token;
  }

  Future<void> signOut() async {
    await _firebaseApi.signOut();
  }
}
