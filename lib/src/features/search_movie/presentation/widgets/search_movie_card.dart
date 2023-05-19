import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../../../../common/common.dart';
import '../../../../core/core.dart';
import '../../../features.dart';

class SearchMovieCard extends StatelessWidget {
  const SearchMovieCard({
    super.key,
    required this.movie,
  });

  final MovieEntity movie;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () =>
          Navigator.push(context, MaterialPageRoute(builder: (context) {
        return MovieDetailScreen(
          movieDetailArguments: MovieDetailArguments(
            movieId: movie.id,
          ),
        );
      })),
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: Sizes.dimen_16.w,
          vertical: Sizes.dimen_4.h,
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.baseline,
          textBaseline: TextBaseline.alphabetic,
          children: [
            Padding(
              padding: EdgeInsets.all(Sizes.dimen_8.w),
              child: movie.posterPath == null
                  ? Container(
                      width: Sizes.dimen_100.w,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage(AssetConstants.noImage),
                        ),
                      ),
                    )
                  : ClipRRect(
                      child: CachedNetworkImage(
                        imageUrl:
                            '${ApiConstants.BASE_IMAGE_URL}${movie.posterPath}',
                        width: Sizes.dimen_100.w,
                      ),
                    ),
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(
                    movie.title,
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                  Text(
                    movie.overview ?? '',
                    maxLines: 6,
                    overflow: TextOverflow.ellipsis,
                    style: Theme.of(context).textTheme.greyCaption,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
