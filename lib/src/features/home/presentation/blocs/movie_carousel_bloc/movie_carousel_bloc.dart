import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:movie_app/src/core/errors/failures/failures.dart';
import 'package:movie_app/src/features/home/presentation/blocs/movie_backdrop_bloc/movie_backdrop_bloc.dart';

import '../../../../../common/movie/domain/domain.dart';

part 'movie_carousel_event.dart';
part 'movie_carousel_state.dart';

class MovieCarouselBloc extends Bloc<MovieCarouselEvent, MovieCarouselState> {
  final GetTrending _getTrending;
  final MovieBackdropBloc movieBackdropBloc;
  MovieCarouselBloc({
    required GetTrending getTrending,
    required this.movieBackdropBloc,
  })  : _getTrending = getTrending,
        super(MovieCarouselInitialState()) {
    on<CarouselLoadEvent>(_onCarouselLoadEvent);
  }

  Future<void> _onCarouselLoadEvent(
      CarouselLoadEvent event, Emitter<MovieCarouselState> emit) async {
    Either<Failure, List<MovieEntity>> eitherFailureOrMovies =
        await _getTrending();
    eitherFailureOrMovies.fold(
        (failure) => emit(
              MovieCarouselErrorState(
                failureType: failure.failureType,
              ),
            ), (movies) {
      movieBackdropBloc
          .add(MovieBackdropChangedEvent(movies[event.defaultIndex]));
      emit(
        MovieCarouselLoadedState(
          movies: movies,
          defaultIndex: event.defaultIndex,
        ),
      );
    });
  }
}
