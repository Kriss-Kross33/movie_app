import 'package:dartz/dartz.dart';
import 'package:movie_app/src/core/errors/failures/failures.dart';

abstract class Usecase<Type, Params> {
  Future<Either<Failure, Type>> call(Params params);
}
