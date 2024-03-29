import 'package:movie_app/src/common/movie/data/data.dart';

import '../../../../core/core.dart';

class MovieRemoteDataSourceImpl extends MovieRemoteDataSource {
  final ApiClient _client;

  MovieRemoteDataSourceImpl(this._client);
  @override
  Future<List<MovieModel>> getTrending() async {
    return await _getMovies('trending/movie/day');
  }

  @override
  Future<List<MovieModel>> getPopular() async {
    return await _getMovies('movie/popular');
  }

  @override
  Future<List<MovieModel>> getComingSoon() async {
    return await _getMovies('movie/upcoming');
  }

  @override
  Future<List<MovieModel>> getPlayingNow() async {
    return await _getMovies('movie/now_playing');
  }

  Future<List<MovieModel>> _getMovies(String path) async {
    final response = await _client.get(path);
    final movies = MoviesResultModel.fromJson(response).movies;
    return movies!;
  }
}
