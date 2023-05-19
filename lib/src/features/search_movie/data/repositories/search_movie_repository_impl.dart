import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:movie_app/src/common/movie/domain/entities/movie_entity.dart';
import 'package:movie_app/src/core/errors/failures/failures.dart';
import 'package:movie_app/src/features/search_movie/data/data.dart';

import '../../domain/domain.dart';

class SearchMovieRepositoryImpl extends SearchMovieRepository {
  SearchMovieRepositoryImpl(
      {required SearchMovieRemoteDataSource remoteDataSource})
      : _remoteDataSource = remoteDataSource;
  final SearchMovieRemoteDataSource _remoteDataSource;
  @override
  Future<Either<Failure, List<MovieEntity>?>> searchMovie(
      String queryString) async {
    try {
      final remoteData = await _remoteDataSource.searchMovie(queryString);
      return right(remoteData);
    } on SocketException {
      return left(Failure(failureType: FailureType.network));
    } catch (e) {
      return left(Failure(failureType: FailureType.api));
    }
  }
}
