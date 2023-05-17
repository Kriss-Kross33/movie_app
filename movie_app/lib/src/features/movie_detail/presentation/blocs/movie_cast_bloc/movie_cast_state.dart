part of 'movie_cast_bloc.dart';

@immutable
abstract class MovieCastState extends Equatable {
  const MovieCastState();
  @override
  List<Object> get props => [];
}

class MovieCastInitialState extends MovieCastState {}

class MovieCastLoadingState extends MovieCastState {}

class MovieCastLoadedState extends MovieCastState {
  final List<MovieCastEntity> movieCasts;

  MovieCastLoadedState({required this.movieCasts});

  @override
  List<Object> get props => [movieCasts];
}

class MovieCastErrorState extends MovieCastState {
  const MovieCastErrorState({required this.failureType});

  final FailureType failureType;

  @override
  List<Object> get props => [failureType];
}
