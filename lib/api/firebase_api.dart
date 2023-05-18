import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class FirebaseApi {
  Future<String?> facebookSignIn() async {
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

    return token;
  }

  Future<String?> googleSignIn() async {
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

    return token;
  }

  Future<void> signOut() async {
    await GoogleSignIn().signOut();
    await FacebookAuth.instance.logOut();
    await FirebaseAuth.instance.signOut();
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
}
