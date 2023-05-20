import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:movie_app/src/common/common.dart';
import 'package:movie_app/src/core/core.dart';

import '../../../../fixtures/fixture_reader.dart';
import 'movie_repository_impl_test.mocks.dart';

@GenerateMocks([MovieRemoteDataSource])
void main() {
  late MockMovieRemoteDataSource mockMovieRemoteDataSource;
  late MovieRepository movieRepository;

  setUp(() {
    mockMovieRemoteDataSource = MockMovieRemoteDataSource();
    movieRepository =
        MovieRepositoryImpl(remoteDataSource: mockMovieRemoteDataSource);
  });

  void setupMoclMovieRemoteDataSource(
      Future<List<MovieModel>> Function() getmovies, List<MovieModel> movies) {
    when(getmovies()).thenAnswer((_) async => movies);
  }

  group('getPopular', () {
    final Map<String, dynamic> moviesMap =
        json.decode(fixture('movie_results.json'));

    final movies = MoviesResultModel.fromJson(moviesMap).movies!;
    test(
        'should return the right side of [Either] when call to server is successful',
        () async {
      //* arrange
      setupMoclMovieRemoteDataSource(
          mockMovieRemoteDataSource.getPopular, movies);
      //* act
      final result = await movieRepository.getPopular();
      //* assert
      verify(mockMovieRemoteDataSource.getPopular());
      expect(result, equals(right(movies)));
    });

    test('should throw [ServerException]', () async {
      //* arrange
      when(mockMovieRemoteDataSource.getPopular()).thenThrow(
        ServerException(errorMessage: 'Unknown error form server'),
      );
      //* act
      final result = await movieRepository.getPopular();
      //* assert
      verify(mockMovieRemoteDataSource.getPopular());
      expect(result, equals(left(Failure(failureType: FailureType.api))));
    });
  });

  group('getPlayingNow', () {
    final Map<String, dynamic> moviesMap =
        json.decode(fixture('movie_results.json'));

    final movies = MoviesResultModel.fromJson(moviesMap).movies!;
    test(
        'should return the right side of [Either] when call to server is successful',
        () async {
      //* arrange
      setupMoclMovieRemoteDataSource(
          mockMovieRemoteDataSource.getPlayingNow, movies);
      //* act
      final result = await movieRepository.getPlayingNow();
      //* assert
      verify(mockMovieRemoteDataSource.getPlayingNow());
      expect(result, equals(right(movies)));
    });

    test('should throw [ServerException]', () async {
      //* arrange
      when(mockMovieRemoteDataSource.getPlayingNow()).thenThrow(
        ServerException(errorMessage: 'Unknown error form server'),
      );
      //* act
      final result = await movieRepository.getPlayingNow();
      //* assert
      verify(mockMovieRemoteDataSource.getPlayingNow());
      expect(result, equals(left(Failure(failureType: FailureType.api))));
    });
  });

  group('getComingSoon', () {
    final Map<String, dynamic> moviesMap =
        json.decode(fixture('movie_results.json'));

    final movies = MoviesResultModel.fromJson(moviesMap).movies!;
    test(
        'should return the right side of [Either] when call to server is successful',
        () async {
      //* arrange
      setupMoclMovieRemoteDataSource(
          mockMovieRemoteDataSource.getComingSoon, movies);
      //* act
      final result = await movieRepository.getComingSoon();
      //* assert
      verify(mockMovieRemoteDataSource.getComingSoon());
      expect(result, equals(right(movies)));
    });

    test('should throw [ServerException]', () async {
      //* arrange
      when(mockMovieRemoteDataSource.getComingSoon()).thenThrow(
        ServerException(errorMessage: 'Unknown error form server'),
      );
      //* act
      final result = await movieRepository.getComingSoon();
      //* assert
      verify(mockMovieRemoteDataSource.getComingSoon());
      expect(result, equals(left(Failure(failureType: FailureType.api))));
    });
  });

  group('getTrending', () {
    final Map<String, dynamic> moviesMap =
        json.decode(fixture('movie_results.json'));

    final movies = MoviesResultModel.fromJson(moviesMap).movies!;
    test(
        'should return the right side of [Either] when call to server is successful',
        () async {
      //* arrange
      setupMoclMovieRemoteDataSource(
          mockMovieRemoteDataSource.getTrending, movies);
      //* act
      final result = await movieRepository.getTrending();
      //* assert
      verify(mockMovieRemoteDataSource.getTrending());
      expect(result, equals(right(movies)));
    });

    test('should throw [ServerException]', () async {
      //* arrange
      when(mockMovieRemoteDataSource.getTrending()).thenThrow(
        ServerException(errorMessage: 'Unknown error form server'),
      );
      //* act
      final result = await movieRepository.getTrending();
      //* assert
      verify(mockMovieRemoteDataSource.getTrending());
      expect(result, equals(left(Failure(failureType: FailureType.api))));
    });
  });
}
