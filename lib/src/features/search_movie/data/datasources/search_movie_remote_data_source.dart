import '../../../../common/movie/data/data.dart';

abstract class SearchMovieRemoteDataSource {
  Future<List<MovieModel>?> searchMovie(String queryString);
}
