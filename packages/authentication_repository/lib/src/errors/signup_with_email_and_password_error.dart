class SignupWithEmailAndPasswordError implements Exception {
  SignupWithEmailAndPasswordError({this.errorMessage = 'Unknown error'});

  final String errorMessage;

  factory SignupWithEmailAndPasswordError.fromCode(String code) {
    return switch (code) {
      'invalid-email' =>
        SignupWithEmailAndPasswordError(errorMessage: 'Email is not valid'),
      'user-disabled' => SignupWithEmailAndPasswordError(
          errorMessage:
              'This email has been disabled. Please contact support for help'),
      'operation-not-allowed' => SignupWithEmailAndPasswordError(
          errorMessage: 'Operation is not allowed. Please contact support'),
      'weak-password' => SignupWithEmailAndPasswordError(
          errorMessage: 'Weak password. Please enter a stronger password'),
      'email-already-in-use' => SignupWithEmailAndPasswordError(
          errorMessage: 'An account with this email already exist'),
      _ => SignupWithEmailAndPasswordError(),
    };
  }
}
