import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../../../common/common.dart';
import '../../../../../core/core.dart';
import '../../../domain/domain.dart';

part 'search_movie_event.dart';
part 'search_movie_state.dart';

class SearchMovieBloc extends Bloc<SearchMovieEvent, SearchMovieState> {
  SearchMovieBloc({required SearchMovie searchMovie})
      : _searchMovie = searchMovie,
        super(SearchMovieInitialState()) {
    on<MovieSearchTriggeredEvent>(_onMovieSearchTriggeredEvent);
  }

  final SearchMovie _searchMovie;

  Future<void> _onMovieSearchTriggeredEvent(
      MovieSearchTriggeredEvent event, Emitter<SearchMovieState> emit) async {
    if (event.queryString.length > 2) {
      emit(SearchMovieLoadingState());
      final _eitherFailureOrMovieDetail =
          await _searchMovie(SearchMovieParams(queryString: event.queryString));
      _eitherFailureOrMovieDetail.fold(
        (failure) =>
            emit(SearchMovieErrorState(failureType: failure.failureType)),
        (movies) => emit(
          SearchMovieLoadedState(movies: movies),
        ),
      );
    }
  }
}
