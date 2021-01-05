import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:movie_app/src/core/constants/api_constants.dart';
import 'package:movie_app/src/core/constants/size_constants.dart';
import '../../../../../core/extensions/size_extension.dart';

class MovieCardWidget extends StatelessWidget {
  final int movieId;
  final String posterPath;

  const MovieCardWidget({
    Key key,
    this.movieId,
    this.posterPath,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 32,
      borderRadius: BorderRadius.circular(Sizes.dimen_16.w),
      child: GestureDetector(
        onTap: () {},
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
