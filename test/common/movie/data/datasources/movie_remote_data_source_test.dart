import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:movie_app/src/common/common.dart';
import 'package:movie_app/src/core/core.dart';

import '../../../../fixtures/fixture_reader.dart';
import 'movie_remote_data_source_test.mocks.dart';

@GenerateMocks([ApiClient])
void main() {
  late MockApiClient mockApiClient;
  late MovieRemoteDataSource remoteDataSource;

  setUpAll(() {
    setUpLocator();
  });

  setUp(() {
    mockApiClient = MockApiClient();
    remoteDataSource = MovieRemoteDataSourceImpl(mockApiClient);
  });

  final Map<String, dynamic> moviesMap =
      json.decode(fixture('movie_results.json'));

  final movies = MoviesResultModel.fromJson(moviesMap).movies!;

  void setupMockApiClient() {
    when(mockApiClient.get(any, params: anyNamed('params')))
        .thenAnswer((_) async => moviesMap);
  }

  group('getPopular', () {
    test(
        'should return [List<MovieModel>] when the call to server is successful',
        () async {
      //* arrange
      setupMockApiClient();
      //* act
      final result = await remoteDataSource.getPopular();
      //* assert
      verify(mockApiClient.get(any, params: anyNamed('params')));
      expect(result, equals(movies));
      verifyNoMoreInteractions(mockApiClient);
    });
  });

  group('getComingSoon', () {
    test(
        'should return [List<MovieModel>] when the call to server is successful',
        () async {
      //* arrange
      setupMockApiClient();
      //* act
      final result = await remoteDataSource.getComingSoon();
      //* assert
      verify(mockApiClient.get(any, params: anyNamed('params')));
      expect(result, equals(movies));
      verifyNoMoreInteractions(mockApiClient);
    });
  });

  group('getTrending', () {
    test(
        'should return [List<MovieModel>] when the call to server is successful',
        () async {
      //* arrange
      setupMockApiClient();
      //* act
      final result = await remoteDataSource.getTrending();
      //* assert
      verify(mockApiClient.get(any, params: anyNamed('params')));
      expect(result, equals(movies));
      verifyNoMoreInteractions(mockApiClient);
    });
  });

  group('getPlayingNow', () {
    test(
        'should return [List<MovieModel>] when the call to server is successful',
        () async {
      //* arrange
      setupMockApiClient();
      //* act
      final result = await remoteDataSource.getPlayingNow();
      //* assert
      verify(mockApiClient.get(any, params: anyNamed('params')));
      expect(result, equals(movies));
      verifyNoMoreInteractions(mockApiClient);
    });
  });
}
