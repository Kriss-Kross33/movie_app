import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/src/core/di/service_locator.dart';
import 'package:movie_app/src/core/widgets/app_error_widget/app_error_widget.dart';
import 'package:movie_app/src/features/home/presentation/blocs/movie_backdrop_bloc/movie_backdrop_bloc.dart';
import 'package:movie_app/src/features/home/presentation/blocs/movie_carousel_bloc/movie_carousel_bloc.dart';
import 'package:movie_app/src/features/home/presentation/blocs/movie_tabbed_bloc/movie_tabbed_bloc.dart';
import 'package:movie_app/src/features/home/presentation/widgets/custom_navigation_drawer/custom_navigation_drawer.dart';
import 'package:movie_app/src/features/home/presentation/widgets/movie_carousel/movie_carousel_widget.dart';
import 'package:movie_app/src/features/home/presentation/widgets/movie_tab/movie_tab_widget.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late MovieCarouselBloc movieCarouselBloc;
  late MovieBackdropBloc movieBackdropBloc;
  late MovieTabbedBloc movieTabbedBloc;

  @override
  void dispose() {
    movieCarouselBloc.close();
    movieBackdropBloc.close();
    movieTabbedBloc.close();
    super.dispose();
  }

  @override
  void initState() {
    movieCarouselBloc = locator<MovieCarouselBloc>();
    movieTabbedBloc = locator<MovieTabbedBloc>();
    movieBackdropBloc = movieCarouselBloc.movieBackdropBloc;
    movieCarouselBloc.add(CarouselLoadEvent());
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
