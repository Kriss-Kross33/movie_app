import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../../../../core/core.dart';
import '../../domain/domain.dart';
import 'widgets.dart';

class MovieDetailImageContainer extends StatelessWidget {
  const MovieDetailImageContainer({
    super.key,
    required this.movie,
  });

  final MovieDetailEntity movie;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          foregroundDecoration: BoxDecoration(
              gradient: LinearGradient(colors: [
            Theme.of(context).primaryColor.withOpacity(0.2),
            Theme.of(context).primaryColor,
          ], begin: Alignment.topCenter, end: Alignment.bottomCenter)),
          child: CachedNetworkImage(
            imageUrl: '${ApiConstants.BASE_IMAGE_URL}${movie.posterPath}',
            width: ScreenUtil().screenWidth,
          ),
        ),
        Positioned(
          left: 0,
          right: 0,
          bottom: 0,
          child: ListTile(
            title: Text(
              movie.title,
              style: Theme.of(context).textTheme.titleLarge,
            ),
            subtitle: Text(
              movie.releaseDate,
              style: Theme.of(context).textTheme.greyDisplayLarge,
            ),
            trailing: Text(
              '${movie.voteAverage.convertToPercentage}',
              style: Theme.of(context).textTheme.violetLabelLarge,
            ),
          ),
        ),
        Positioned(
          left: Sizes.dimen_16.w,
          right: Sizes.dimen_16.w,
          top: ScreenUtil().statusBarHeight + Sizes.dimen_4.h,
          child: MovieDetailAppBar(),
        ),
      ],
    );
  }
}
