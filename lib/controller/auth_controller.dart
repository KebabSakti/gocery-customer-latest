import 'package:gocery/api/firebase_api.dart';

import '../api/auth_api.dart';
import '../model/customer/customer_model.dart';

class AuthController {
  final _authApi = AuthApi();
  final _firebaseApi = FirebaseApi();

  Future<void> googleSignIn() async {
    //
  }

  Future<void> facebookSignIn() async {
    //
  }

  Future<void> signOut() async {
    //
  }

  void authListener(void Function(CustomerModel? accountModel) onData) {
    //
  }
}
