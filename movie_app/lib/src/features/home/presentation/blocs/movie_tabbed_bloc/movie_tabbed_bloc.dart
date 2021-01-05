import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:movie_app/src/core/errors/failures/failures.dart';
import 'package:movie_app/src/features/home/domain/entities/movie_entity.dart';
import 'package:movie_app/src/features/home/domain/usecases/get_coming_soon.dart';
import 'package:movie_app/src/features/home/domain/usecases/get_now_playing.dart';
import 'package:movie_app/src/features/home/domain/usecases/get_popular.dart';

part 'movie_tabbed_event.dart';
part 'movie_tabbed_state.dart';

class MovieTabbedBloc extends Bloc<MovieTabbedEvent, MovieTabbedState> {
  final GetPlayingNow _getPlayingNow;
  final GetPopular _getPopular;
  final GetComingSoon _getComingSoon;
  MovieTabbedBloc({
    @required GetPlayingNow getPlayingNow,
    @required GetComingSoon getComingSoon,
    @required GetPopular getPopular,
  })  : _getComingSoon = getComingSoon,
        _getPlayingNow = getPlayingNow,
        _getPopular = getPopular,
        super(MovieTabbedInitialState());

  @override
  Stream<MovieTabbedState> mapEventToState(
    MovieTabbedEvent event,
  ) async* {
    if (event is MovieTabChangedEvent) {
      Either<Failure, List<MovieEntity>> eitherFailureOrMovies;
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
      yield eitherFailureOrMovies.fold(
          (failure) =>
              MovieTabLoadFailure(currentTabIndex: event.currentTabIndex),
          (movies) {
        print('Index: ${event.currentTabIndex}, Movies: $movies');
        return MovieTabChangedState(
          currentTabIndex: event.currentTabIndex,
          movies: movies,
        );
      });
    }
  }
}
