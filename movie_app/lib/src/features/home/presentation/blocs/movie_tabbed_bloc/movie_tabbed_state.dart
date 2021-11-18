part of 'movie_tabbed_bloc.dart';

abstract class MovieTabbedState extends Equatable {
  final int currentTabIndex;
  const MovieTabbedState({required this.currentTabIndex});

  @override
  List<Object> get props => [currentTabIndex];
}

class MovieTabbedInitialState extends MovieTabbedState {
  const MovieTabbedInitialState([int currentTabIndex = 0])
      : super(currentTabIndex: currentTabIndex);
}

class MovieTabChangedState extends MovieTabbedState {
  final List<MovieEntity> movies;

  const MovieTabChangedState(
      {required int currentTabIndex, required this.movies})
      : super(currentTabIndex: currentTabIndex);

  @override
  List<Object> get props => [currentTabIndex];
}

class MovieTabLoadFailureState extends MovieTabbedState {
  final FailureType failureType;
  const MovieTabLoadFailureState(
      {required int currentTabIndex, required this.failureType})
      : super(currentTabIndex: currentTabIndex);

  @override
  List<Object> get props => [currentTabIndex];
}
