import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:movie_app/src/features/features.dart';

import 'get_movie_cast_test.mocks.dart';

@GenerateMocks([MovieDetailRepository])
void main() {
  late MockMovieDetailRepository mockMovieDetailRepository;
  late GetMovieCast getMovieCast;

  setUp(() {
    mockMovieDetailRepository = MockMovieDetailRepository();
    getMovieCast = GetMovieCast(mockMovieDetailRepository);
  });

  test('should get the list of movie cast from the repository', () async {
    final cast = <MovieCastEntity>[
      MovieCastEntity(
        name: "Keanu Reeves",
        profilePath: "/4D0PpNI0kmP58hgrwGC3wCjxhnm.jpg",
        character: "John Wick",
        creditId: "5ce330040e0a266f86d00c76",
      ),
    ];
    //* arrange
    when(mockMovieDetailRepository.getMovieCast(any))
        .thenAnswer((_) async => right(cast));
    //* act
    final result = await getMovieCast(MovieParams(1));
    //* assert
    verify(mockMovieDetailRepository.getMovieCast(1));
    expect(result, right(cast));
  });
}
