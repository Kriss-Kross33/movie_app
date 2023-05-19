import 'dart:io';

import 'package:movie_app/src/features/search_movie/data/datasources/datasources.dart';

import '../../../../common/movie/data/data.dart';
import '../../../../core/core.dart';

class SearchMovieRemoteDataSourceImpl extends SearchMovieRemoteDataSource {
  SearchMovieRemoteDataSourceImpl(ApiClient client) : _client = client;

  final ApiClient _client;
  @override
  Future<List<MovieModel>?> searchMovie(String queryString) async {
    try {
      final response = await _client.get('search/movie', params: {
        'query': queryString,
      });
      return MoviesResultModel.fromJson(response).movies;
    } on SocketException {
      rethrow;
    } on ServerException {
      rethrow;
    } catch (e) {
      throw ServerException(errorMessage: e.toString());
    }
  }
}
