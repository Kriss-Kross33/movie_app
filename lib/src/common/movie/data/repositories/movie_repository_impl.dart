import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:movie_app/src/common/movie/data/data.dart';
import 'package:movie_app/src/common/movie/domain/entities/movie_entity.dart';
import 'package:movie_app/src/common/movie/domain/repositories/movie_repository.dart';

import '../../../../core/core.dart';

typedef Future<List<MovieEntity>> _MovieCategoryChooser();

class MovieRepositoryImpl extends MovieRepository {
  final MovieRemoteDataSource remoteDataSource;

  MovieRepositoryImpl({required this.remoteDataSource});

  @override
  Future<Either<Failure, List<MovieEntity>>> getTrending() async {
    return await _getMovie(() async => await remoteDataSource.getTrending());
  }

  @override
  Future<Either<Failure, List<MovieEntity>>> getComingSoon() async {
    return await _getMovie(() async => await remoteDataSource.getComingSoon());
  }

  @override
  Future<Either<Failure, List<MovieEntity>>> getPlayingNow() async {
    return await _getMovie(() async => await remoteDataSource.getPlayingNow());
  }

  @override
  Future<Either<Failure, List<MovieEntity>>> getPopular() async {
    return await _getMovie(() async => await remoteDataSource.getPopular());
  }

  Future<Either<Failure, List<MovieEntity>>> _getMovie(
      _MovieCategoryChooser getMovieCategory) async {
    try {
      final movies = await getMovieCategory();
      return Right(movies);
    } on SocketException {
      return Left(Failure(failureType: FailureType.network));
    } on ServerException {
      return Left(Failure(failureType: FailureType.api));
    }
  }
}
