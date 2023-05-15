part of 'movie_detail_bloc.dart';

@immutable
abstract class MovieDetailEvent extends Equatable {
  const MovieDetailEvent();

  @override
  List<Object> get props => [];
}

class MovieDetailFetchEvent extends MovieDetailEvent {
  MovieDetailFetchEvent(this.id);
  final int id;

  @override
  List<Object> get props => [id];
}
