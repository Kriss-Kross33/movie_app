class LoginWithGoogleError implements Exception {
  LoginWithGoogleError({this.errorMessage = 'Unknown Error'});

  final String errorMessage;

  factory LoginWithGoogleError.fromCode(String code) {
    return switch (code) {
      'account-exists-with-different-credential' => LoginWithGoogleError(
          errorMessage: 'Account exists with different credentials.',
        ),
      'invalid-credential' => LoginWithGoogleError(
          errorMessage: 'The credential received is malformed or has expired.',
        ),
      'operation-not-allowed' => LoginWithGoogleError(
          errorMessage: 'Operation is not allowed.  Please contact support.',
        ),
      'user-disabled' => LoginWithGoogleError(
          errorMessage:
              'This user has been disabled. Please contact support for help.',
        ),
      'user-not-found' => LoginWithGoogleError(
          errorMessage: 'Email is not found, please create an account.',
        ),
      'wrong-password' => LoginWithGoogleError(
          errorMessage: 'Incorrect password, please try again.',
        ),
      'invalid-verification-code' => LoginWithGoogleError(
          errorMessage: 'The credential verification code received is invalid.',
        ),
      'invalid-verification-id' => LoginWithGoogleError(
          errorMessage: 'The credential verification ID received is invalid.',
        ),
      _ => LoginWithGoogleError(),
    };
  }
}
