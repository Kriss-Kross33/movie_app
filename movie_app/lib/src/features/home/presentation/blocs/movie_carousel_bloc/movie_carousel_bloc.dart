import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:movie_app/src/core/errors/failures/failures.dart';
import 'package:movie_app/src/features/home/domain/entities/movie_entity.dart';
import 'package:movie_app/src/features/home/domain/usecases/get_trending.dart';
import 'package:movie_app/src/features/home/presentation/blocs/movie_backdrop_bloc/movie_backdrop_bloc.dart';

part 'movie_carousel_event.dart';
part 'movie_carousel_state.dart';

class MovieCarouselBloc extends Bloc<MovieCarouselEvent, MovieCarouselState> {
  final GetTrending _getTrending;
  final MovieBackdropBloc movieBackdropBloc;
  MovieCarouselBloc({
    @required GetTrending getTrending,
    @required this.movieBackdropBloc,
  })  : _getTrending = getTrending,
        super(MovieCarouselInitialState());

  @override
  Stream<MovieCarouselState> mapEventToState(
    MovieCarouselEvent event,
  ) async* {
    if (event is CarouselLoadEvent) {
      Either<Failure, List<MovieEntity>> eitherFailureOrMovies =
          await _getTrending();
      yield eitherFailureOrMovies.fold(
          (failure) => MovieCarouselErrorState(
                failureType: failure.failureType,
              ), (movies) {
        movieBackdropBloc
            .add(MovieBackdropChangedEvent(movies[event.defaultIndex]));
        return MovieCarouselLoadedState(
          movies: movies,
          defaultIndex: event.defaultIndex,
        );
      });
    }
  }
}
