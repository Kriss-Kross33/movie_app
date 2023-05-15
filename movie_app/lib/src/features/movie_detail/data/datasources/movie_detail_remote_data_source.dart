import '../models/models.dart';

abstract class MovieDetailRemoteDataSource {
  Future<MovieDetailModel> getMovieDetail(int id);
}
