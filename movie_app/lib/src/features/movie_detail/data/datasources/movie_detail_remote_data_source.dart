import '../models/models.dart';

abstract class MovieDetailRemoteDataSource {
  Future<MovieDetailModel> getMovieDetail(int id);
  Future<List<MovieCastModel>> getMovieCast(int id);
}
