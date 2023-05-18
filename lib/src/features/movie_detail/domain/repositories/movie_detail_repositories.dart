import 'package:dartz/dartz.dart';

import '../../../../core/core.dart';
import '../entities/entities.dart';

abstract class MovieDetailRepository {
  Future<Either<Failure, MovieDetailEntity>> getMovieDetail(int id);
  Future<Either<Failure, List<MovieCastEntity>>> getMovieCast(int id);
  Future<Either<Failure, List<MovieVideoEntity>?>> getMovieVideos(int id);
}
