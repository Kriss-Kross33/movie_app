import '../models/models.dart';

abstract class MovieLocalDataSource {
  Future<List<MovieModel>> getMoviesFromCache();

  Future<void> cacheMovies(List<MovieModel> movies);
}
