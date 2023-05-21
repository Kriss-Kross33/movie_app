import 'package:firebase_auth/firebase_auth.dart' as firebase_auth;
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

  Future<void> loginWithGoogle() async {
    try {} on firebase_auth.FirebaseAuthException catch (e) {
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
}
