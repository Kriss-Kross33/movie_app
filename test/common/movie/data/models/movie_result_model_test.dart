import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:movie_app/src/common/common.dart';

import '../../../../fixtures/fixture_reader.dart';

void main() {
  Map<String, dynamic> moviesMap = json.decode(fixture('movie_results.json'));
  print('Movies MAp $moviesMap');

  final movies = MoviesResultModel(movies: [
    MovieModel(
      adult: false,
      backdropPath: "/nLBRD7UPR6GjmWQp6ASAfCTaWKX.jpg",
      genreIds: [16, 10751, 12, 14, 35],
      id: 502356,
      originalLanguage: "en",
      originalTitle: "The Super Mario Bros. Movie",
      overview:
          "While working underground to fix a water main, Brooklyn plumbers—and brothers—Mario and Luigi are transported down a mysterious pipe and wander into a magical new world. But when the brothers are separated, Mario embarks on an epic quest to find Luigi.",
      popularity: 8501.774,
      posterPath: "/qNBAXBIQlnOThrVvA6mA2B5ggV6.jpg",
      releaseDate: "2023-04-05",
      title: "The Super Mario Bros. Movie",
      video: false,
      voteAverage: 7.6,
      voteCount: 2570,
    ),
  ]);
  group('fromJson', () {
    test('should return a List<MovieModel>', () {
      //* arrange

      //* act
      final result = MoviesResultModel.fromJson(moviesMap);

      //* assert
      expect(result, equals(movies));
    });
  });

  group('toJson', () {
    test('should return Json Map containing the proper data', () {
      //* act
      final result = movies.toJson();
      print('');
      print(result);
      //* assert
      expect(result, equals(moviesMap));
    });
  });
}
