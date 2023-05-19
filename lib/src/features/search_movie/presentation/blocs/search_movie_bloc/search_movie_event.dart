part of 'search_movie_bloc.dart';

abstract class SearchMovieEvent extends Equatable {
  const SearchMovieEvent();

  @override
  List<Object> get props => [];
}

class MovieSearchTriggeredEvent extends SearchMovieEvent {
  MovieSearchTriggeredEvent({required this.queryString});
  final String queryString;

  @override
  List<Object> get props => [queryString];
}
