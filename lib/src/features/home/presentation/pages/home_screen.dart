import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/src/features/home/presentation/blocs/blocs.dart';

import '../../../../common/common.dart';
import '../../../../core/core.dart';
import '../../../search_movie/search_movie.dart';
import '../widgets/widgets.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late MovieCarouselBloc movieCarouselBloc;
  late MovieBackdropBloc movieBackdropBloc;
  late MovieTabbedBloc movieTabbedBloc;
  late SearchMovieBloc searchMovieBloc;

  @override
  void dispose() {
    movieCarouselBloc.close();
    movieBackdropBloc.close();
    movieTabbedBloc.close();
    searchMovieBloc.close();
    super.dispose();
  }

  @override
  void initState() {
    movieCarouselBloc = locator<MovieCarouselBloc>();
    movieTabbedBloc = locator<MovieTabbedBloc>();
    movieBackdropBloc = movieCarouselBloc.movieBackdropBloc;
    movieCarouselBloc.add(CarouselLoadEvent());
    searchMovieBloc = locator<SearchMovieBloc>();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: <BlocProvider>[
        BlocProvider<MovieCarouselBloc>(
          create: (context) => movieCarouselBloc,
        ),
        BlocProvider<MovieBackdropBloc>(
          create: (context) => movieBackdropBloc,
        ),
        BlocProvider<MovieTabbedBloc>(
          create: (context) => movieTabbedBloc,
        ),
        BlocProvider<SearchMovieBloc>(
          create: (context) => searchMovieBloc,
        ),
      ],
      child: Scaffold(
        drawer: const CustomNavigationDrawer(),
        body: BlocBuilder<MovieCarouselBloc, MovieCarouselState>(
          builder: (context, state) {
            if (state is MovieCarouselLoadedState) {
              return Stack(
                fit: StackFit.expand,
                children: [
                  FractionallySizedBox(
                    alignment: Alignment.topCenter,
                    heightFactor: 0.58,
                    child: MovieCarouselWidget(
                      movies: state.movies,
                      index: state.defaultIndex,
                    ),
                  ),
                  FractionallySizedBox(
                    alignment: Alignment.bottomCenter,
                    heightFactor: 0.42,
                    child: MovieTabWidget(),
                  )
                ],
              );
            } else if (state is MovieCarouselErrorState) {
              return AppErrorWidget(
                failureType: state.failureType,
                onPressed: () => movieCarouselBloc.add(CarouselLoadEvent()),
              );
            }
            return SizedBox.shrink();
          },
        ),
      ),
    );
  }
}
