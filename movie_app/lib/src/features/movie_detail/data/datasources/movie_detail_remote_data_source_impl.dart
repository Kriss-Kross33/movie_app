import 'dart:io';

import '../../../../core/core.dart';
import '../models/models.dart';
import 'datasources.dart';

class MovieDetailRemoteDataSourceImpl extends MovieDetailRemoteDataSource {
  MovieDetailRemoteDataSourceImpl(ApiClient client) : _client = client;

  final ApiClient _client;

  @override
  Future<MovieDetailModel> getMovieDetail(int id) async {
    try {
      Map<String, dynamic> response = await _client.get('movie/$id');
      return MovieDetailModel.fromJson(response);
    } on SocketException {
      rethrow;
    } on ServerException {
      rethrow;
    } catch (e) {
      throw ServerException(errorMessage: e.toString());
    }
  }

  @override
  Future<List<MovieCastModel>> getMovieCast(int id) async {
    try {
      Map<String, dynamic> response = await _client.get('movie/$id/credits');
      return MovieCreditModel.fromJson(response).cast;
    } on SocketException {
      rethrow;
    } on ServerException {
      rethrow;
    } catch (e) {
      throw ServerException(errorMessage: e.toString());
    }
  }
}
