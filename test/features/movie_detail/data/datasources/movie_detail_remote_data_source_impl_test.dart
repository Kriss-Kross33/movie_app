import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:movie_app/src/core/core.dart';
import 'package:movie_app/src/features/features.dart';

import '../../../../common/movie/data/datasources/movie_remote_data_source_test.mocks.dart';
import '../../../../fixtures/fixture_reader.dart';

@GenerateMocks([ApiClient])
void main() {
  late MockApiClient mockApiClient;
  late MovieDetailRemoteDataSource remoteDataSource;
  setUp(() {
    mockApiClient = MockApiClient();
    remoteDataSource = MovieDetailRemoteDataSourceImpl(mockApiClient);
  });

  group('getMovieDetail', () {
    test('should pass the movie id to be fetched and return MovieDetailModel',
        () async {
      final movieDetailMap =
          json.decode(fixture('movie_detail.json')) as Map<String, dynamic>;
      final movieDetail = MovieDetailModel.fromJson(movieDetailMap);
      //* arrange
      when(mockApiClient.get(any, params: anyNamed('params')))
          .thenAnswer((_) async => movieDetailMap);
      //* act
      final result = await remoteDataSource.getMovieDetail(1234);
      //* assert
      verify(mockApiClient.get(any, params: anyNamed('params')));
      expect(result, equals(movieDetail));
    });
  });

  group(
    'getMovieCast',
    () {
      test('should pass the movie id and return a List<MovieCastModel>',
          () async {
        //* arrange
        final movieCreditJson = json.decode(fixture('movie_cast_list.json'));
        final movieCast = MovieCreditModel.fromJson(movieCreditJson).cast;
        when(mockApiClient.get(any, params: anyNamed('params')))
            .thenAnswer((_) => movieCreditJson);
        //* act
        final result = await remoteDataSource.getMovieCast(1234);

        //*assert
        verify(mockApiClient.get(any, params: anyNamed('params')));
        expect(result, movieCast);
      });
    },
  );

  group('getMovieVideos', () {
    test('should pass the movie id and return a List<MovieVideoModel>',
        () async {
      //* arrange
      final movieVideoResultsMap = json.decode(fixture('movie_cast_list.json'));
      final movieVideos =
          MovieVideoResultsModel.fromJson(movieVideoResultsMap).videos;
      when(mockApiClient.get(any, params: anyNamed('params')))
          .thenAnswer((_) => movieVideoResultsMap);
      //* act
      final result = await remoteDataSource.getMovieVideos(1234);

      //*assert
      verify(mockApiClient.get(any, params: anyNamed('params')));
      expect(result, movieVideos);
    });
  });
}
