part of 'movie_video_bloc.dart';

abstract class MovieVideoEvent extends Equatable {
  const MovieVideoEvent();

  @override
  List<Object> get props => [];
}

class MovieVideoFetchEvent extends MovieVideoEvent {
  MovieVideoFetchEvent(this.id);
  final int id;

  @override
  List<Object> get props => [id];
}
