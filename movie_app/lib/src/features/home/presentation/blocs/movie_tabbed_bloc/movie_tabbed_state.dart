part of 'movie_tabbed_bloc.dart';

abstract class MovieTabbedState extends Equatable {
  final int currentTabIndex;
  const MovieTabbedState({this.currentTabIndex});

  @override
  List<Object> get props => [currentTabIndex];
}

class MovieTabbedInitialState extends MovieTabbedState {}

class MovieTabChangedState extends MovieTabbedState {
  final List<MovieEntity> movies;

  const MovieTabChangedState(
      {@required int currentTabIndex, @required this.movies})
      : super(currentTabIndex: currentTabIndex);

  @override
  List<Object> get props => [currentTabIndex];
}

class MovieTabLoadFailure extends MovieTabbedState {
  const MovieTabLoadFailure({int currentTabIndex})
      : super(currentTabIndex: currentTabIndex);

  @override
  List<Object> get props => [currentTabIndex];
}
