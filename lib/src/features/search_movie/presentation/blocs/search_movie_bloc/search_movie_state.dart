part of 'search_movie_bloc.dart';

abstract class SearchMovieState extends Equatable {
  const SearchMovieState();

  @override
  List<Object?> get props => [];
}

class SearchMovieInitialState extends SearchMovieState {}

class SearchMovieLoadingState extends SearchMovieState {}

class SearchMovieLoadedState extends SearchMovieState {
  SearchMovieLoadedState({required this.movies});
  final List<MovieEntity>? movies;

  @override
  List<Object?> get props => [movies];
}

class SearchMovieErrorState extends SearchMovieState {
  SearchMovieErrorState({required this.failureType});
  final FailureType failureType;

  @override
  List<Object> get props => [failureType];
}
