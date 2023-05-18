import 'package:dartz/dartz.dart';
import 'package:movie_app/src/features/movie_detail/domain/domain.dart';

import '../../../../core/core.dart';

class GetMovieVideos extends Usecase<List<MovieVideoEntity>?, MovieParams> {
  GetMovieVideos(this.repository);
  final MovieDetailRepository repository;

  Future<Either<Failure, List<MovieVideoEntity>?>> call(
      MovieParams params) async {
    return await repository.getMovieVideos(params.id);
  }
}
