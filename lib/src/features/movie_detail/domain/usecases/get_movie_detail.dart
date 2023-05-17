import 'package:dartz/dartz.dart';
import 'package:movie_app/src/core/core.dart';
import 'package:movie_app/src/features/movie_detail/domain/domain.dart';

class GetMovieDetail extends Usecase<MovieDetailEntity, MovieParams> {
  GetMovieDetail(this.repository);
  final MovieDetailRepository repository;
  @override
  Future<Either<Failure, MovieDetailEntity>> call(MovieParams params) async {
    return await repository.getMovieDetail(params.id);
  }
}
