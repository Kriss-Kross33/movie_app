import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:movie_app/src/core/errors/failures/failures.dart';

import '../../../../../common/movie/domain/domain.dart';

part 'movie_tabbed_event.dart';
part 'movie_tabbed_state.dart';

class MovieTabbedBloc extends Bloc<MovieTabbedEvent, MovieTabbedState> {
  final GetPlayingNow _getPlayingNow;
  final GetPopular _getPopular;
  final GetComingSoon _getComingSoon;
  MovieTabbedBloc({
    required GetPlayingNow getPlayingNow,
    required GetComingSoon getComingSoon,
    required GetPopular getPopular,
  })  : _getComingSoon = getComingSoon,
        _getPlayingNow = getPlayingNow,
        _getPopular = getPopular,
        super(MovieTabbedInitialState()) {
    on<MovieTabChangedEvent>(_onMovieTabChangedEvent);
  }

  Future<void> _onMovieTabChangedEvent(
      MovieTabChangedEvent event, Emitter<MovieTabbedState> emit) async {
    late Either<Failure, List<MovieEntity>> eitherFailureOrMovies;
    switch (event.currentTabIndex) {
      case 0:
        eitherFailureOrMovies = await _getPopular();
        break;
      case 1:
        eitherFailureOrMovies = await _getPlayingNow();
        break;
      case 2:
        eitherFailureOrMovies = await _getComingSoon();
        break;
    }
    eitherFailureOrMovies.fold(
        (failure) => emit(
              MovieTabLoadFailureState(
                currentTabIndex: event.currentTabIndex,
                failureType: failure.failureType,
              ),
            ), (movies) {
      print('Index: ${event.currentTabIndex}, Movies: $movies');
      emit(
        MovieTabChangedState(
          currentTabIndex: event.currentTabIndex,
          movies: movies,
        ),
      );
    });
  }
}
