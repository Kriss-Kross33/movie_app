import 'package:authentication_repository/src/models/user_model.dart';
import 'package:firebase_auth/firebase_auth.dart' as firebase_auth;
import 'package:flutter/foundation.dart';
import 'package:google_sign_in/google_sign_in.dart';

import 'errors/errors.dart';

class AuthenticationRepository {
  final firebase_auth.FirebaseAuth? _firebaseAuth;
  final GoogleSignIn? _googleSignIn;

  AuthenticationRepository({
    firebase_auth.FirebaseAuth? firebaseAuth,
    GoogleSignIn? googleSignIn,
  })  : _firebaseAuth = firebaseAuth ?? firebase_auth.FirebaseAuth.instance,
        _googleSignIn = googleSignIn ?? GoogleSignIn.standard();

  Future<void> loginWithEmailAndPassword(
      {required String email, required String password}) async {
    try {
      await _firebaseAuth?.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
    } on firebase_auth.FirebaseAuthException catch (e) {
      throw LoginWithEmailAndPasswordFailure(errorMessage: e.toString());
    } catch (e) {
      throw LoginWithEmailAndPasswordFailure();
    }
  }

  Stream<UserModel> get user {
    return _firebaseAuth!.authStateChanges().map((firebaseUser) {
      final user = firebaseUser == null ? UserModel.empty : firebaseUser.toUser;
      return user;
    });
  }

  bool get isWeb => kIsWeb;

  Future<void> loginWithGoogle() async {
    try {
      late final firebase_auth.AuthCredential credential;
      if (isWeb) {
        final googleProvider = firebase_auth.GoogleAuthProvider();
        final userCredential =
            await _firebaseAuth?.signInWithPopup(googleProvider);
        credential = userCredential!.credential!;
      } else {
        final googleUser = await _googleSignIn?.signIn();
        final googleAuth = await googleUser?.authentication;
        credential = firebase_auth.GoogleAuthProvider.credential(
          accessToken: googleAuth?.accessToken,
          idToken: googleAuth?.idToken,
        );
      }
      await _firebaseAuth?.signInWithCredential(credential);
    } on firebase_auth.FirebaseAuthException catch (e) {
      throw LoginWithGoogleError(errorMessage: e.toString());
    } catch (e) {
      throw LoginWithGoogleError();
    }
  }

  Future<void> signup({
    required String email,
    required String password,
  }) async {
    try {
      await _firebaseAuth?.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
    } on firebase_auth.FirebaseAuthException catch (e) {
      throw SignupWithEmailAndPasswordError(errorMessage: e.toString());
    } catch (e) {
      throw SignupWithEmailAndPasswordError();
    }
  }

  Future<void> logout() async {
    try {
      await _firebaseAuth?.signOut();
      await _googleSignIn?.signOut();
    } catch (e) {
      throw LogoutError(errorMessage: e.toString());
    }
  }
}

extension on firebase_auth.User {
  UserModel get toUser => UserModel(
        id: uid,
        email: email,
        displayPicture: photoURL,
        username: displayName,
      );
}
