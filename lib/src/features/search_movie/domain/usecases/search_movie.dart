import 'package:dartz/dartz.dart';
import 'package:movie_app/src/features/search_movie/domain/domain.dart';

import '../../../../common/common.dart';
import '../../../../core/core.dart';

class SearchMovie extends Usecase<List<MovieEntity>?, SearchMovieParams> {
  SearchMovie(this.repository);
  final SearchMovieRepository repository;

  Future<Either<Failure, List<MovieEntity>?>> call(
      SearchMovieParams params) async {
    return await repository.searchMovie(params.queryString);
  }
}
