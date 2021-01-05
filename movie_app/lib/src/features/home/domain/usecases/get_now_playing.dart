import 'package:dartz/dartz.dart';
import 'package:movie_app/src/core/errors/failures/failures.dart';
import 'package:movie_app/src/features/home/domain/entities/movie_entity.dart';
import 'package:movie_app/src/features/home/domain/repositories/movie_repository.dart';

class GetPlayingNow {
  final MovieRepository repository;

  GetPlayingNow(this.repository);

  Future<Either<Failure, List<MovieEntity>>> call() async {
    return await repository.getPlayingNow();
  }
}
