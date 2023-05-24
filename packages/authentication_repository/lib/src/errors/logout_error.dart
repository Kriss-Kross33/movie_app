class LogoutError implements Exception {
  LogoutError({this.errorMessage = 'Unknown Error'});
  final String errorMessage;
}
