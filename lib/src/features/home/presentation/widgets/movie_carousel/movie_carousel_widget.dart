import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:movie_app/src/common/movie/domain/entities/movie_entity.dart';
import 'package:movie_app/src/common/widgets/movie_app_bar.dart';
import 'package:movie_app/src/features/features.dart';
import 'package:movie_app/src/features/home/presentation/widgets/logo_widget.dart';
import 'package:movie_app/src/features/home/presentation/widgets/movie_carousel/movie_backdrop_widget.dart';
import 'package:movie_app/src/features/home/presentation/widgets/movie_carousel/movie_data_widget.dart';
import 'package:movie_app/src/features/home/presentation/widgets/movie_carousel/movie_page_viewer.dart';
import 'package:movie_app/src/features/home/presentation/widgets/separator.dart';

import '../../../../../core/core.dart';

class MovieCarouselWidget extends StatelessWidget {
  final List<MovieEntity> movies;
  final int index;

  const MovieCarouselWidget(
      {Key? key, required this.movies, required this.index})
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
            MovieAppBar(
              leading: IconButton(
                icon: SvgPicture.asset(
                  'assets/images/svgs/menu.svg',
                  height: Sizes.dimen_20.h,
                ),
                onPressed: () {
                  Scaffold.of(context).openDrawer();
                },
              ),
              title: Expanded(
                child: const LogoWidget(
                  height: Sizes.dimen_22,
                ),
              ),
              trailing: IconButton(
                icon: Icon(
                  Icons.search,
                  color: Colors.white,
                  size: Sizes.dimen_20.h,
                ),
                onPressed: () {
                  showSearch(
                    context: context,
                    delegate: CustomSearchDelegate(
                      searchMovieBloc: context.read<SearchMovieBloc>(),
                    ),
                  );
                },
              ),
            ),
            MoviePageViewer(movies: movies, initialPage: index),
            MovieDataWidget(),
            Separator(),
          ],
        ),
      ],
    );
  }
}
