import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:movie_app/src/core/constants/api_constants.dart';
import 'package:movie_app/src/core/constants/size_constants.dart';

import '../../../../../core/extensions/size_extension.dart';
import '../../../../../core/extensions/string_extensions.dart';

class MovieTabCardWidget extends StatelessWidget {
  final int movieId;
  final String title;
  final String posterPath;

  const MovieTabCardWidget({
    Key? key,
    required this.movieId,
    required this.title,
    required this.posterPath,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        Expanded(
          child: ClipRRect(
            borderRadius: BorderRadius.circular(Sizes.dimen_16.w),
            child: CachedNetworkImage(
              imageUrl: '${ApiConstants.BASE_IMAGE_URL}$posterPath',
              fit: BoxFit.cover,
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.only(top: Sizes.dimen_4.h),
          child: Text(
            title.intelliTrim(),
            maxLines: 1,
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.bodyText2,
          ),
        ),
      ],
    );
  }
}
