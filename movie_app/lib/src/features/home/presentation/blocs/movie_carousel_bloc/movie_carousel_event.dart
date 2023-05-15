part of 'movie_carousel_bloc.dart';

abstract class MovieCarouselEvent extends Equatable {
  const MovieCarouselEvent();

  @override
  List<Object> get props => [];
}

///  Notifies the bloc to load the movies in the carousel
/// [defaultIndex] determines the movie to be displayed in
/// the center of the carousel.
class CarouselLoadEvent extends MovieCarouselEvent {
  final int defaultIndex;

  const CarouselLoadEvent({this.defaultIndex = 0})
      : assert(defaultIndex >= 0,
            'Default Index should not be a negative integer');

  @override
  List<Object> get props => [defaultIndex];
}
