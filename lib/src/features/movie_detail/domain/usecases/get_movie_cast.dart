import 'package:dartz/dartz.dart';
import 'package:movie_app/src/features/movie_detail/domain/domain.dart';

import '../../../../core/core.dart';

class GetMovieCast extends Usecase<List<MovieCastEntity>, MovieParams> {
  GetMovieCast(this.repository);

  final MovieDetailRepository repository;

  Future<Either<Failure, List<MovieCastEntity>>> call(
      MovieParams params) async {
    return await repository.getMovieCast(params.id);
  }
}
