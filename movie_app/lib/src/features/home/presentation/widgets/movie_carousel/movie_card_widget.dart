import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:movie_app/src/core/constants/api_constants.dart';
import 'package:movie_app/src/core/constants/size_constants.dart';
import 'package:movie_app/src/features/features.dart';

import '../../../../../core/extensions/size_extension.dart';

class MovieCardWidget extends StatelessWidget {
  final int movieId;
  final String posterPath;

  const MovieCardWidget({
    Key? key,
    required this.movieId,
    required this.posterPath,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 32,
      borderRadius: BorderRadius.circular(Sizes.dimen_16.w),
      child: GestureDetector(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) {
                return MovieDetailScreen(
                  movieDetailArguments: MovieDetailArguments(
                    movieId: movieId,
                  ),
                );
              },
            ),
          );
        },
        child: ClipRRect(
          borderRadius: BorderRadius.circular(Sizes.dimen_16.w),
          child: CachedNetworkImage(
            imageUrl: '${ApiConstants.BASE_IMAGE_URL}$posterPath',
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}
