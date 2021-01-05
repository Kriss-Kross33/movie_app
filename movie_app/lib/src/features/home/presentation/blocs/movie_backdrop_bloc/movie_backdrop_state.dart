part of 'movie_backdrop_bloc.dart';

abstract class MovieBackdropState extends Equatable {
  const MovieBackdropState();

  @override
  List<Object> get props => [];
}

class MovieBackdropInitialState extends MovieBackdropState {}

class MovieBackdropChangedState extends MovieBackdropState {
  final MovieEntity movie;

  MovieBackdropChangedState(this.movie);

  @override
  List<Object> get props => [movie];
}
