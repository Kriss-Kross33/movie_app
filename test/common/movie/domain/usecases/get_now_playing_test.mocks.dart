// Mocks generated by Mockito 5.4.1 from annotations
// in movie_app/test/common/movie/domain/usecases/get_now_playing_test.dart.
// Do not manually edit this file.

// @dart=2.19

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:async' as _i4;

import 'package:dartz/dartz.dart' as _i2;
import 'package:mockito/mockito.dart' as _i1;
import 'package:movie_app/src/common/movie/domain/entities/movie_entity.dart'
    as _i6;
import 'package:movie_app/src/common/movie/domain/repositories/movie_repository.dart'
    as _i3;
import 'package:movie_app/src/core/errors/failures/failures.dart' as _i5;

// ignore_for_file: type=lint
// ignore_for_file: avoid_redundant_argument_values
// ignore_for_file: avoid_setters_without_getters
// ignore_for_file: comment_references
// ignore_for_file: implementation_imports
// ignore_for_file: invalid_use_of_visible_for_testing_member
// ignore_for_file: prefer_const_constructors
// ignore_for_file: unnecessary_parenthesis
// ignore_for_file: camel_case_types
// ignore_for_file: subtype_of_sealed_class

class _FakeEither_0<L, R> extends _i1.SmartFake implements _i2.Either<L, R> {
  _FakeEither_0(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

/// A class which mocks [MovieRepository].
///
/// See the documentation for Mockito's code generation for more information.
class MockMovieRepository extends _i1.Mock implements _i3.MovieRepository {
  MockMovieRepository() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i4.Future<_i2.Either<_i5.Failure, List<_i6.MovieEntity>>> getTrending() =>
      (super.noSuchMethod(
        Invocation.method(
          #getTrending,
          [],
        ),
        returnValue:
            _i4.Future<_i2.Either<_i5.Failure, List<_i6.MovieEntity>>>.value(
                _FakeEither_0<_i5.Failure, List<_i6.MovieEntity>>(
          this,
          Invocation.method(
            #getTrending,
            [],
          ),
        )),
      ) as _i4.Future<_i2.Either<_i5.Failure, List<_i6.MovieEntity>>>);
  @override
  _i4.Future<_i2.Either<_i5.Failure, List<_i6.MovieEntity>>> getPopular() =>
      (super.noSuchMethod(
        Invocation.method(
          #getPopular,
          [],
        ),
        returnValue:
            _i4.Future<_i2.Either<_i5.Failure, List<_i6.MovieEntity>>>.value(
                _FakeEither_0<_i5.Failure, List<_i6.MovieEntity>>(
          this,
          Invocation.method(
            #getPopular,
            [],
          ),
        )),
      ) as _i4.Future<_i2.Either<_i5.Failure, List<_i6.MovieEntity>>>);
  @override
  _i4.Future<_i2.Either<_i5.Failure, List<_i6.MovieEntity>>> getComingSoon() =>
      (super.noSuchMethod(
        Invocation.method(
          #getComingSoon,
          [],
        ),
        returnValue:
            _i4.Future<_i2.Either<_i5.Failure, List<_i6.MovieEntity>>>.value(
                _FakeEither_0<_i5.Failure, List<_i6.MovieEntity>>(
          this,
          Invocation.method(
            #getComingSoon,
            [],
          ),
        )),
      ) as _i4.Future<_i2.Either<_i5.Failure, List<_i6.MovieEntity>>>);
  @override
  _i4.Future<_i2.Either<_i5.Failure, List<_i6.MovieEntity>>> getPlayingNow() =>
      (super.noSuchMethod(
        Invocation.method(
          #getPlayingNow,
          [],
        ),
        returnValue:
            _i4.Future<_i2.Either<_i5.Failure, List<_i6.MovieEntity>>>.value(
                _FakeEither_0<_i5.Failure, List<_i6.MovieEntity>>(
          this,
          Invocation.method(
            #getPlayingNow,
            [],
          ),
        )),
      ) as _i4.Future<_i2.Either<_i5.Failure, List<_i6.MovieEntity>>>);
}
