import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:movie_app/src/common/common.dart';

import 'get_coming_soon_test.mocks.dart';

@GenerateMocks([MovieRepository])
void main() {
  late MockMovieRepository mockMovieRepository;
  late GetComingSoon getComingSoon;

  setUp(() {
    mockMovieRepository = MockMovieRepository();
    getComingSoon = GetComingSoon(mockMovieRepository);
  });

  test('should get List of movies coming soon from the repository', () async {
    final movies = <MovieEntity>[
      MovieEntity(
        backdropPath: "/nLBRD7UPR6GjmWQp6ASAfCTaWKX.jpg",
        id: 502356,
        overview:
            "While working underground to fix a water main, Brooklyn plumbers—and brothers—Mario and Luigi are transported down a mysterious pipe and wander into a magical new world. But when the brothers are separated, Mario embarks on an epic quest to find Luigi.",
        posterPath: "/qNBAXBIQlnOThrVvA6mA2B5ggV6.jpg",
        releaseDate: "2023-04-05",
        title: "The Super Mario Bros. Movie",
        voteAverage: 7.6,
      ),
    ];
    //* arrange
    when(mockMovieRepository.getComingSoon())
        .thenAnswer((_) async => right(movies));
    //* act
    final result = await getComingSoon();
    //* assert
    verify(mockMovieRepository.getComingSoon());
    expect(result, equals(right(movies)));
  });
}
