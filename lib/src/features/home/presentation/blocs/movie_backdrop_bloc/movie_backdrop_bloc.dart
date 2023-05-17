import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:movie_app/src/features/home/domain/entities/movie_entity.dart';

part 'movie_backdrop_event.dart';
part 'movie_backdrop_state.dart';

class MovieBackdropBloc extends Bloc<MovieBackdropEvent, MovieBackdropState> {
  MovieBackdropBloc() : super(MovieBackdropInitialState()) {
    on<MovieBackdropChangedEvent>(_onMovieBackdropChangedEvent);
  }

  Future<void> _onMovieBackdropChangedEvent(
      MovieBackdropChangedEvent event, Emitter<MovieBackdropState> emit) async {
    emit(MovieBackdropChangedState(event.movie));
  }
}
