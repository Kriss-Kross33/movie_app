import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/src/core/constants/size_constants.dart';
import 'package:movie_app/src/core/constants/translation_constants.dart';
import 'package:movie_app/src/core/widgets/app_error_widget/app_error_widget.dart';
import 'package:movie_app/src/features/home/presentation/blocs/movie_tabbed_bloc/movie_tabbed_bloc.dart';
import 'package:movie_app/src/features/home/presentation/widgets/movie_tab/movie_tab_constants.dart';
import 'package:movie_app/src/features/home/presentation/widgets/movie_tab/movie_tab_list_view_builder.dart';
import 'package:movie_app/src/features/home/presentation/widgets/movie_tab/tab_title_widget.dart';

import '../../../../../core/extensions/size_extension.dart';
import '../../../../../core/extensions/string_extensions.dart';

class MovieTabWidget extends StatefulWidget {
  @override
  _MovieTabWidgetState createState() => _MovieTabWidgetState();
}

class _MovieTabWidgetState extends State<MovieTabWidget> {
  MovieTabbedBloc get movieTabBloc => BlocProvider.of<MovieTabbedBloc>(context);
  int currentTabIndex = 0;

  @override
  void initState() {
    super.initState();
    movieTabBloc.add(MovieTabChangedEvent(currentTabIndex: currentTabIndex));
  }

  @override
  void dispose() {
    super.dispose();
    movieTabBloc.close();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MovieTabbedBloc, MovieTabbedState>(
      builder: (context, state) {
        return Padding(
          padding: EdgeInsets.only(bottom: Sizes.dimen_8.h),
          child: Column(
            children: <Widget>[
              Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  for (int i = 0; i < MovieTabConstants.movieTabs.length; i++)
                    TabTitleWidget(
                      title: MovieTabConstants.movieTabs[i].title,
                      onTap: () => _onTabTapped(i),
                      isSelected: MovieTabConstants.movieTabs[i].index ==
                          state.currentTabIndex,
                    ),
                ],
              ),
              if (state is MovieTabChangedState)
                state.movies.isEmpty
                    ? Expanded(
                        child: Center(
                          child: Text(
                            TranslationConstants.NO_MOVIES.translate(context) ??
                                TranslationConstants.NO_MOVIES,
                            style: Theme.of(context).textTheme.titleMedium,
                          ),
                        ),
                      )
                    : Expanded(
                        child: MovieListViewBuilder(
                          movies: state.movies,
                        ),
                      ),
              if (state is MovieTabLoadFailureState)
                Expanded(
                  child: AppErrorWidget(
                    onPressed: () => movieTabBloc.add(
                      MovieTabChangedEvent(
                        currentTabIndex: state.currentTabIndex,
                      ),
                    ),
                    failureType: state.failureType,
                  ),
                )
            ],
          ),
        );
      },
    );
  }

  void _onTabTapped(int index) {
    movieTabBloc.add(MovieTabChangedEvent(currentTabIndex: index));
  }
}
