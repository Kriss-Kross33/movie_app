import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:movie_app/src/common/common.dart';

import '../../../../fixtures/fixture_reader.dart';

void main() {
  //Map<String, dynamic> movieMap = json.decode(fixture('movie_results.json'));

  final movieMap = {
    "id": 502356,
    "video": false,
    "vote_count": 2570,
    "vote_average": 7.6,
    "title": "The Super Mario Bros. Movie",
    "release_date": '2023-04-05',
    "original_language": "en",
    "original_title": "The Super Mario Bros. Movie",
    "genre_ids": [16, 10751, 12, 14, 35],
    "backdrop_path": "/nLBRD7UPR6GjmWQp6ASAfCTaWKX.jpg",
    "adult": false,
    "overview":
        "While working underground to fix a water main, Brooklyn plumbers—and brothers—Mario and Luigi are transported down a mysterious pipe and wander into a magical new world. But when the brothers are separated, Mario embarks on an epic quest to find Luigi.",
    "poster_path": "/qNBAXBIQlnOThrVvA6mA2B5ggV6.jpg",
    "popularity": 8501.774,
    "mediaType": null,
  };

  // List<MovieModel> movies = MoviesResultModel.fromJson(movieMap).movies!;
  final movieModel = MovieModel.fromJson(movieMap);

  test('should subclass [MovieEntity]', () {
    expect(movieModel, isA<MovieEntity>());
  });

  group('fromJson', () {
    test('should return a valid model', () {
      //* act
      final result = MovieModel.fromJson(movieMap);
      print(result.toJson());
      //* assert
      expect(result, equals(movieModel));
    });
  });

  group('toJson', () {
    test('should return a Json map containing the proper data', () {
      //* arrange
      Map<String, dynamic> jsonMap = json.decode(fixture('movie.json'));
      //* act
      final result = movieModel.toJson();
      expect(result, jsonMap);
    });
  });
}
