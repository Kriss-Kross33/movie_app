part of 'movie_cast_bloc.dart';

@immutable
abstract class MovieCastEvent extends Equatable {
  const MovieCastEvent();

  @override
  List<Object> get props => [];
}

class MovieCastFetchEvent extends MovieCastEvent {
  MovieCastFetchEvent(this.id);
  final int id;

  @override
  List<Object> get props => [id];
}
