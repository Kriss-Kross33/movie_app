import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:movie_app/src/core/errors/failures/failures.dart';

import '../../domain/domain.dart';
import '../data.dart';

typedef Future<R> _ReturnMovieInfo<R>();

class MovieDetailRepositoryImpl extends MovieDetailRepository {
  MovieDetailRepositoryImpl({required this.remoteDataSource});

  final MovieDetailRemoteDataSource remoteDataSource;
  @override
  Future<Either<Failure, MovieDetailEntity>> getMovieDetail(int id) async {
    return _getMovieInfo(
      () async => await remoteDataSource.getMovieDetail(id),
    );
  }

  @override
  Future<Either<Failure, List<MovieCastEntity>>> getMovieCast(int id) async {
    return _getMovieInfo<List<MovieCastEntity>>(
      () async => await remoteDataSource.getMovieCast(id),
    );
  }

  @override
  Future<Either<Failure, List<MovieVideoEntity>?>> getMovieVideos(
    int id,
  ) async {
    return _getMovieInfo(
      () async => await remoteDataSource.getMovieVideos(id),
    );
  }

  Future<Either<Failure, R>> _getMovieInfo<R>(
    _ReturnMovieInfo<R> returnMovieInfo,
  ) async {
    try {
      final remoteData =
          await returnMovieInfo(); //await remoteDataSource.getMovieVideos(id);
      return right(remoteData);
    } on SocketException {
      return left(Failure(failureType: FailureType.network));
    } catch (e) {
      return left(Failure(failureType: FailureType.api));
    }
  }
}
