class LoginWithEmailAndPasswordFailure implements Exception {
  LoginWithEmailAndPasswordFailure({this.errorMessage = 'Unknown Error'});

  final String errorMessage;

  factory LoginWithEmailAndPasswordFailure.fromCode(String code) {
    return switch (code) {
      'invalid-email' => LoginWithEmailAndPasswordFailure(
          errorMessage: 'Email is not valid or badly formatted'),
      'user-disabled' => LoginWithEmailAndPasswordFailure(
          errorMessage:
              'This user has been disabled. Please contact customer support'),
      'wrong-password' => LoginWithEmailAndPasswordFailure(
          errorMessage:
              'Incorrect password. Please provide the correct password for this account'),
      'user-not-found' =>
        LoginWithEmailAndPasswordFailure(errorMessage: 'User not found'),
      _ => LoginWithEmailAndPasswordFailure()
    };
  }
}
