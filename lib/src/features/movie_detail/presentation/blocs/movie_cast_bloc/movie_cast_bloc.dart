import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

import '../../../../../core/core.dart';
import '../../../domain/domain.dart';

part 'movie_cast_event.dart';
part 'movie_cast_state.dart';

class MovieCastBloc extends Bloc<MovieCastEvent, MovieCastState> {
  MovieCastBloc({
    required GetMovieCast getMovieCast,
  })  : _getMovieCast = getMovieCast,
        super(MovieCastInitialState()) {
    on<MovieCastFetchEvent>(_onMovieCastFetchEvent);
  }

  final GetMovieCast _getMovieCast;

  Future<void> _onMovieCastFetchEvent(
      MovieCastFetchEvent event, Emitter<MovieCastState> emit) async {
    emit(MovieCastLoadingState());
    final _eitherFailureOrMovieDetail =
        await _getMovieCast(MovieParams(event.id));
    _eitherFailureOrMovieDetail.fold(
        (failure) =>
            emit(MovieCastErrorState(failureType: failure.failureType)),
        (movieCasts) => emit(MovieCastLoadedState(movieCasts: movieCasts)));
  }
}
