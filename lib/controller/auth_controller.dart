import '../api/auth_api.dart';
import '../api/firebase_api.dart';
import '../common/helper/storage.dart';

class AuthController {
  final _authApi = AuthApi();
  final _firebaseApi = FirebaseApi();
  final _storage = Storage();

  Future<void> googleSignIn() async {
    final firebaseToken = await _firebaseApi.googleSignIn();

    if (firebaseToken != null) {
      final token = await _authApi.validate(firebaseToken);
      await _updateConfig(token);
    }
  }

  Future<void> facebookSignIn() async {
    final firebaseToken = await _firebaseApi.facebookSignIn();

    if (firebaseToken != null) {
      final token = await _authApi.validate(firebaseToken);
      await _updateConfig(token);
    }
  }

  Future<void> signOut() async {
    await _firebaseApi.signOut();
    await _updateConfig(null);
  }

  Future<String?> token() async {
    final token = await _storage.read('auth');

    return token;
  }

  Future<void> _updateConfig(String? authToken) async {
    await _storage.write('auth', authToken);
  }
}
