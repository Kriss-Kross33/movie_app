import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/src/core/core.dart';
import 'package:movie_app/src/features/search_movie/presentation/presentation.dart';

import '../../../../common/common.dart';

class CustomSearchDelegate extends SearchDelegate {
  CustomSearchDelegate({required this.searchMovieBloc});
  final SearchMovieBloc searchMovieBloc;

  @override
  ThemeData appBarTheme(BuildContext context) {
    return Theme.of(context).copyWith(
        inputDecorationTheme: InputDecorationTheme(
      hintStyle: Theme.of(context).textTheme.greyDisplayLarge,
    ));
  }

  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
        icon: Icon(Icons.clear),
        onPressed: query.isEmpty ? null : () => query = '',
      ),
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return GestureDetector(
      onTap: () => close(context, null),
      child: Icon(
        Icons.arrow_back_ios,
        color: Colors.white,
        size: Sizes.dimen_20.h,
      ),
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    searchMovieBloc.add(
      MovieSearchTriggeredEvent(queryString: query),
    );
    return BlocBuilder<SearchMovieBloc, SearchMovieState>(
        bloc: searchMovieBloc,
        builder: (context, state) {
          if (state is SearchMovieLoadedState) {
            if (state.movies!.isEmpty) {
              return Center(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: Sizes.dimen_70.w),
                  child: Text(
                    TranslationConstants.NO_MOVIES.translate(context)!,
                    textAlign: TextAlign.center,
                  ),
                ),
              );
            }
            return ListView.builder(
              itemCount: state.movies!.length,
              itemBuilder: (context, index) {
                final movies = state.movies;
                return SearchMovieCard(
                  movie: movies![index],
                );
              },
            );
          } else if (state is SearchMovieErrorState) {
            return AppErrorWidget(
              failureType: state.failureType,
              onPressed: () => searchMovieBloc
                  .add(MovieSearchTriggeredEvent(queryString: query)),
            );
          }
          return SizedBox.shrink();
        });
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return SizedBox.shrink();
  }
}
