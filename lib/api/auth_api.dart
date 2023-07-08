import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

import '../common/config/const.dart';
import '../common/helper/network.dart';
import '../common/helper/storage.dart';
import '../common/helper/utility.dart';

class AuthApi {
  final _http = NetworkClient();
  final _storage = Storage();

  Future<void> facebookSignIn() async {
    String? token;

    try {
      final credential = await _facebookCredential();

      if (credential != null) {
        final userCredential = await _signInWithCredential(credential);
        token = await userCredential.user?.getIdToken();
      }
    } on Exception catch (e) {
      if (e is FirebaseAuthException) {
        if (e.code == 'account-exists-with-different-credential') {
          final credential = await _googleCredential();

          if (credential != null) {
            final userCredential = await _linkCredential(credential);
            token = await userCredential?.user?.getIdToken();
          }
        }
      }
    }

    await _handleFirebaseToken(token);
  }

  Future<void> googleSignIn() async {
    String? token;

    try {
      final credential = await _googleCredential();

      if (credential != null) {
        final userCredential = await _signInWithCredential(credential);
        token = await userCredential.user?.getIdToken();
      }
    } on Exception catch (e) {
      if (e is FirebaseAuthException) {
        if (e.code == 'account-exists-with-different-credential') {
          final credential = await _facebookCredential();

          if (credential != null) {
            final userCredential = await _linkCredential(credential);
            token = await userCredential?.user?.getIdToken();
          }
        }
      }
    }

    await _handleFirebaseToken(token);
  }

  Future<void> signOut() async {
    await GoogleSignIn().signOut();
    await FacebookAuth.instance.logOut();
    await FirebaseAuth.instance.signOut();
    await _saveAuthToken(null);
  }

  Future<String?> token() async {
    final token = await _storage.read('auth');

    return token;
  }

  Future<OAuthCredential?> _facebookCredential() async {
    OAuthCredential? credential;

    final LoginResult loginResult = await FacebookAuth.instance.login();

    if (loginResult.accessToken != null) {
      credential =
          FacebookAuthProvider.credential(loginResult.accessToken!.token);
    }

    return credential;
  }

  Future<OAuthCredential?> _googleCredential() async {
    OAuthCredential? credential;

    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

    final GoogleSignInAuthentication? googleAuth =
        await googleUser?.authentication;

    if (googleAuth != null) {
      credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );
    }

    return credential;
  }

  Future<UserCredential> _signInWithCredential(
      OAuthCredential credential) async {
    final results =
        await FirebaseAuth.instance.signInWithCredential(credential);

    return results;
  }

  Future<UserCredential?> _linkCredential(OAuthCredential credential) async {
    final userCredential =
        await FirebaseAuth.instance.currentUser?.linkWithCredential(credential);

    return userCredential;
  }

  Future<String> _validateFirebaseToken(String firebaseToken) async {
    final request = await _http.post(auth, body: {'token': firebaseToken});
    final json = await compute(parseJson, request.body);
    final token = json['token'];

    return token;
  }

  Future<void> _saveAuthToken(String? authToken) async {
    await _storage.write('auth', authToken);
  }

  Future<void> _handleFirebaseToken(String? firebaseToken) async {
    if (firebaseToken != null) {
      final authToken = await _validateFirebaseToken(firebaseToken);
      await _saveAuthToken(authToken);
    }
  }
}
