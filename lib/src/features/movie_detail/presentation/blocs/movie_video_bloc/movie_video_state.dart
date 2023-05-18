part of 'movie_video_bloc.dart';

abstract class MovieVideoState extends Equatable {
  const MovieVideoState();

  @override
  List<Object?> get props => [];
}

class MovieVideoInitialState extends MovieVideoState {}

class MovieVideoLoadingState extends MovieVideoState {}

class MovieVideoLoadedState extends MovieVideoState {
  final List<MovieVideoEntity>? videos;

  MovieVideoLoadedState({this.videos});

  @override
  List<Object?> get props => [videos];
}

class MovieVideoErrorState extends MovieVideoState {
  const MovieVideoErrorState({required this.failureType});

  final FailureType failureType;

  @override
  List<Object> get props => [failureType];
}
