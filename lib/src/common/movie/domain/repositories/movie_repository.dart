import 'package:dartz/dartz.dart';
import 'package:movie_app/src/common/movie/domain/entities/movie_entity.dart';
import 'package:movie_app/src/core/errors/failures/failures.dart';

abstract class MovieRepository {
  Future<Either<Failure, List<MovieEntity>>> getTrending();
  Future<Either<Failure, List<MovieEntity>>> getPopular();
  Future<Either<Failure, List<MovieEntity>>> getComingSoon();
  Future<Either<Failure, List<MovieEntity>>> getPlayingNow();
}
