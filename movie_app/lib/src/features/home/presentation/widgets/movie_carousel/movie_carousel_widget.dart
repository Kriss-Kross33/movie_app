import 'package:flutter/material.dart';
import 'package:movie_app/src/features/home/domain/entities/movie_entity.dart';
import 'package:movie_app/src/features/home/presentation/widgets/movie_app_bar.dart';
import 'package:movie_app/src/features/home/presentation/widgets/movie_carousel/movie_backdrop_widget.dart';
import 'package:movie_app/src/features/home/presentation/widgets/movie_carousel/movie_data_widget.dart';
import 'package:movie_app/src/features/home/presentation/widgets/movie_carousel/movie_page_viewer.dart';
import 'package:movie_app/src/features/home/presentation/widgets/separator.dart';

class MovieCarouselWidget extends StatelessWidget {
  final List<MovieEntity> movies;
  final int index;

  const MovieCarouselWidget({Key key, this.movies, this.index})
      : assert(index >= 0, 'Index should be 0 or a positive integer'),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      fit: StackFit.expand,
      children: [
        MovieBackdropWidget(),
        Column(
          children: <Widget>[
            MovieAppBar(),
            MoviePageViewer(movies: movies, initialPage: index),
            MovieDataWidget(),
            Separator(),
          ],
        ),
      ],
    );
  }
}
