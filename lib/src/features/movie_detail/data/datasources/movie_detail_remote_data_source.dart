import '../models/models.dart';

abstract class MovieDetailRemoteDataSource {
  Future<MovieDetailModel> getMovieDetail(int id);
  Future<List<MovieCastModel>> getMovieCast(int id);
  Future<List<MovieVideoModel>?> getMovieVideos(int id);
}
