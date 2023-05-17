part of 'movie_detail_bloc.dart';

@immutable
abstract class MovieDetailState extends Equatable {
  const MovieDetailState();

  @override
  List<Object> get props => [];
}

class MovieDetailInitialState extends MovieDetailState {}

class MovieDetailLoadingState extends MovieDetailState {}

class MovieDetailLoadedState extends MovieDetailState {
  final MovieDetailEntity movie;

  MovieDetailLoadedState({required this.movie});

  @override
  List<Object> get props => [movie];
}

class MovieDetailErrorState extends MovieDetailState {
  const MovieDetailErrorState({required this.failureType});

  final FailureType failureType;

  @override
  List<Object> get props => [failureType];
}
