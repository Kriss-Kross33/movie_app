import 'dart:io';

import '../../../../core/core.dart';
import '../models/models.dart';
import 'datasources.dart';

class MovieDetailRemoteDataSourceImpl extends MovieDetailRemoteDataSource {
  MovieDetailRemoteDataSourceImpl(ApiClient client) : _client = client;

  final ApiClient _client;

  @override
  Future<MovieDetailModel> getMovieDetail(int id) async {
    final jsonMap = await _getMovieInfo('movie/$id');
    return MovieDetailModel.fromJson(jsonMap);
  }

  @override
  Future<List<MovieCastModel>> getMovieCast(int id) async {
    final jsonMap = await _getMovieInfo('movie/$id/credits');
    return MovieCreditModel.fromJson(jsonMap).cast;
  }

  @override
  Future<List<MovieVideoModel>?> getMovieVideos(int id) async {
    final jsonMap = await _getMovieInfo('movie/$id/videos');
    return MovieVideoResultsModel.fromJson(jsonMap).videos;
  }

  Future<Map<String, dynamic>> _getMovieInfo<T>(String endpoint) async {
    try {
      Map<String, dynamic> response = await _client.get(endpoint);
      return response;
    } on SocketException {
      rethrow;
    } on ServerException {
      rethrow;
    } catch (e) {
      throw ServerException(errorMessage: e.toString());
    }
  }
}
