import 'package:flutter/material.dart';
import 'package:movie_app/src/features/movie_detail/presentation/presentation.dart';

import '../../../../core/core.dart';
import '../../domain/domain.dart';

class MovieDetailLoadedWidget extends StatelessWidget {
  const MovieDetailLoadedWidget({
    super.key,
    required this.movie,
    required this.movieDetailArguments,
  });

  final MovieDetailArguments movieDetailArguments;
  final MovieDetailEntity movie;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.only(bottom: 60.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            MovieDetailImageContainer(
              movie: movie,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Text(
                movie.overview,
                style: Theme.of(context).textTheme.bodyMedium,
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: Sizes.dimen_16.w,
                vertical: Sizes.dimen_8.h,
              ),
              child: Text(
                TranslationConstants.CAST.translate(context) ??
                    TranslationConstants.CAST,
                style: Theme.of(context).textTheme.titleLarge,
              ),
            ),
            MovieCastWidget(
              movieDetailArguments: movieDetailArguments,
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: Sizes.dimen_16.w,
                vertical: Sizes.dimen_8.h,
              ),
              child: MovieVideosWidget(),
            ),
          ],
        ),
      ),
    );
  }
}
