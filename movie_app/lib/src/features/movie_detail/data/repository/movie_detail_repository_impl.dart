import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:movie_app/src/core/errors/failures/failures.dart';

import '../../domain/domain.dart';
import '../data.dart';

class MovieDetailRepositoryImpl extends MovieDetailRepository {
  MovieDetailRepositoryImpl(this.remoteDataSource);
  final MovieDetailRemoteDataSource remoteDataSource;
  @override
  Future<Either<Failure, MovieDetailEntity>> getMovieDetail(int id) async {
    try {
      final remoteData = await remoteDataSource.getMovieDetail(id);
      return right(remoteData);
    } on SocketException {
      return left(Failure(failureType: FailureType.network));
    } catch (e) {
      return left(Failure(failureType: FailureType.api));
    }
  }
}
