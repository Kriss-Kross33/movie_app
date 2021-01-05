part of 'movie_carousel_bloc.dart';

abstract class MovieCarouselState extends Equatable {
  const MovieCarouselState();

  @override
  List<Object> get props => [];
}

class MovieCarouselInitialState extends MovieCarouselState {}

class MovieCarouselErrorState extends MovieCarouselState {}

class MovieCarouselLoadedState extends MovieCarouselState {
  final List<MovieEntity> movies;
  final int defaultIndex;

  MovieCarouselLoadedState({
    this.movies,
    this.defaultIndex = 0,
  }) : assert(
          defaultIndex >= 0,
          'defaultIndex should not be a negative integer',
        );
  @override
  List<Object> get props => [movies, defaultIndex];
}
