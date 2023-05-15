import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/src/core/constants/size_constants.dart';
import 'package:movie_app/src/core/screenutil/screenutil.dart';
import 'package:movie_app/src/features/home/domain/entities/movie_entity.dart';
import 'package:movie_app/src/features/home/presentation/blocs/movie_backdrop_bloc/movie_backdrop_bloc.dart';
import 'package:movie_app/src/features/home/presentation/widgets/movie_carousel/animated_movie_card_widget.dart';

import '../../../../../core/extensions/size_extension.dart';

class MoviePageViewer extends StatefulWidget {
  final List<MovieEntity> movies;
  final int initialPage;

  const MoviePageViewer({
    Key? key,
    required this.movies,
    required this.initialPage,
  })  : assert(initialPage >= 0, 'initialPage cannot be less than 0'),
        super(key: key);

  @override
  _MoviePageViewerState createState() => _MoviePageViewerState();
}

class _MoviePageViewerState extends State<MoviePageViewer> {
  late PageController _pageController;

  @override
  void initState() {
    super.initState();
    _pageController = PageController(
      initialPage: widget.initialPage,
      keepPage: false,
      viewportFraction: 0.7,
    );
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: Sizes.dimen_10.h),
      height: ScreenUtil().screenHeight * 0.35,
      child: PageView.builder(
        controller: _pageController,
        itemBuilder: (BuildContext context, int index) {
          final MovieEntity movie = widget.movies[index];
          return AnimatedMovieCardWidget(
            index: index,
            pageController: _pageController,
            movieId: movie.id,
            posterPath: movie.posterPath,
          );
        },
        pageSnapping: true,
        itemCount: widget.movies.length,
        onPageChanged: (index) {
          MovieEntity movie = widget.movies[index];
          BlocProvider.of<MovieBackdropBloc>(context)
              .add(MovieBackdropChangedEvent(movie));
        },
      ),
    );
  }
}
