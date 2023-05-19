import 'package:dartz/dartz.dart';

import '../../../../common/movie/domain/domain.dart';
import '../../../../core/core.dart';

abstract class SearchMovieRepository {
  Future<Either<Failure, List<MovieEntity>?>> searchMovie(String queryString);
}
