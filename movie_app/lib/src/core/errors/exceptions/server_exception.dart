class ServerException implements Exception {
  ServerException({required this.errorMessage});
  final String errorMessage;
}
