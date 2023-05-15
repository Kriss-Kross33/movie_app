import 'package:dartz/dartz.dart';
import 'package:movie_app/src/features/movie_detail/domain/entities/movie_detail_entity.dart';

import '../../../../core/core.dart';

abstract class MovieDetailRepository {
  Future<Either<Failure, MovieDetailEntity>> getMovieDetail(int id);
}
