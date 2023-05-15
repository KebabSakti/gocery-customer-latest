import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:gocery/model/customer/customer_model.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';

class FirebaseApi {
  StreamSubscription<User?>? _stream;

  Future<void> facebookSignIn() async {
    try {
      final credential = await _facebookCredential();

      if (credential != null) {
        await _signInWithCredential(credential);
      }
    } on Exception catch (e) {
      if (e is FirebaseAuthException) {
        if (e.code == 'account-exists-with-different-credential') {
          final credential = await _googleCredential();

          if (credential != null) {
            final userCredential = await _signInWithCredential(credential);

            if (userCredential.user == null) {
              await userCredential.user!.linkWithCredential(e.credential!);
            }
          }
        }
      }
    }
  }

  Future<void> googleSignIn() async {
    try {
      final credential = await _googleCredential();

      if (credential != null) {
        await _signInWithCredential(credential);
      }
    } on Exception catch (e) {
      if (e is FirebaseAuthException) {
        if (e.code == 'account-exists-with-different-credential') {
          final credential = await _facebookCredential();

          if (credential != null) {
            final userCredential = await _signInWithCredential(credential);

            if (userCredential.user == null) {
              await userCredential.user!.linkWithCredential(e.credential!);
            }
          }
        }
      }
    }
  }

  Future<void> signOut() async {
    await GoogleSignIn().signOut();
    await FacebookAuth.instance.logOut();
    await FirebaseAuth.instance.signOut();
  }

  void authListener(void Function(CustomerModel? accountModel) onData) {
    _stream = FirebaseAuth.instance.idTokenChanges().listen((user) async {
      if (user == null) {
        onData(null);
      } else {
        final authToken = await user.getIdToken();

        onData(CustomerModel(
          id: user.uid,
          email: user.email,
          name: user.displayName,
          phone: user.phoneNumber,
          image: user.photoURL,
          authToken: authToken,
        ));
      }
    });
  }

  void closeStream() {
    if (_stream != null) {
      _stream!.cancel();
    }
  }

  Future<OAuthCredential?> _facebookCredential() async {
    OAuthCredential? credential;

    final LoginResult loginResult = await FacebookAuth.instance.login();

    if (loginResult.accessToken != null) {
      final OAuthCredential credential =
          FacebookAuthProvider.credential(loginResult.accessToken!.token);

      return credential;
    }

    return credential;
  }

  Future<OAuthCredential?> _googleCredential() async {
    OAuthCredential? credential;

    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

    final GoogleSignInAuthentication? googleAuth =
        await googleUser?.authentication;

    if (googleAuth != null) {
      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );

      return credential;
    }

    return credential;
  }

  Future<UserCredential> _signInWithCredential(
      OAuthCredential credential) async {
    final results =
        await FirebaseAuth.instance.signInWithCredential(credential);

    return results;
  }
}
