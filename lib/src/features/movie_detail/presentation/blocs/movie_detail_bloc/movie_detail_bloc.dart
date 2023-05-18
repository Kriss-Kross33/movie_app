import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

import '../../../../../core/core.dart';
import '../../../domain/domain.dart';
import '../blocs.dart';

part 'movie_detail_event.dart';
part 'movie_detail_state.dart';

class MovieDetailBloc extends Bloc<MovieDetailEvent, MovieDetailState> {
  MovieDetailBloc({
    required GetMovieDetail getMovieDetail,
    required this.movieCastBloc,
    required this.movieVideoBloc,
  })  : _getMovieDetail = getMovieDetail,
        super(MovieDetailInitialState()) {
    on<MovieDetailFetchEvent>(_onMovieDetailFetchEvent);
  }

  final GetMovieDetail _getMovieDetail;
  final MovieCastBloc movieCastBloc;
  final MovieVideoBloc movieVideoBloc;

  Future<void> _onMovieDetailFetchEvent(
      MovieDetailFetchEvent event, Emitter<MovieDetailState> emit) async {
    final _eitherFailureOrMovieDetail =
        await _getMovieDetail(MovieParams(event.id));
    _eitherFailureOrMovieDetail.fold(
        (failure) =>
            emit(MovieDetailErrorState(failureType: failure.failureType)),
        (movie) => emit(MovieDetailLoadedState(movie: movie)));
    movieCastBloc.add(MovieCastFetchEvent(event.id));
    movieVideoBloc.add(MovieVideoFetchEvent(event.id));
  }
}
