import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../../../core/core.dart';
import '../../../domain/domain.dart';

part 'movie_video_event.dart';
part 'movie_video_state.dart';

class MovieVideoBloc extends Bloc<MovieVideoEvent, MovieVideoState> {
  MovieVideoBloc({required GetMovieVideos getMovieVideos})
      : _getMovieVideos = getMovieVideos,
        super(MovieVideoInitialState()) {
    on<MovieVideoFetchEvent>(_onMovieVideoFetchEvent);
  }

  final GetMovieVideos _getMovieVideos;

  Future<void> _onMovieVideoFetchEvent(
      MovieVideoFetchEvent event, Emitter<MovieVideoState> emit) async {
    final _eitherFailureOrMovieDetail =
        await _getMovieVideos(MovieParams(event.id));
    _eitherFailureOrMovieDetail.fold(
        (failure) =>
            emit(MovieVideoErrorState(failureType: failure.failureType)),
        (videos) {
      if (videos != null) {
        emit(
          MovieVideoLoadedState(videos: videos),
        );
      } else {
        emit(MovieVideoInitialState());
      }
    });
  }
}
