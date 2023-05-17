import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/core.dart';
import '../../domain/domain.dart';
import '../blocs/blocs.dart';

class MovieCastWidget extends StatefulWidget {
  const MovieCastWidget({
    super.key,
    required this.movieDetailArguments,
  });

  final MovieDetailArguments movieDetailArguments;

  @override
  State<MovieCastWidget> createState() => _MovieCastWidgetState();
}

class _MovieCastWidgetState extends State<MovieCastWidget> {
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MovieCastBloc, MovieCastState>(
      builder: (context, state) {
        if (state is MovieCastLoadedState) {
          return Padding(
            padding: EdgeInsets.only(bottom: 60),
            child: Container(
              height: Sizes.dimen_200.h,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: state.movieCasts.length,
                itemBuilder: (context, index) {
                  final movieCast = state.movieCasts[index];
                  return SizedBox(
                    height: Sizes.dimen_150.h,
                    width: Sizes.dimen_160.w,
                    child: Card(
                      elevation: 1,
                      margin: EdgeInsets.symmetric(
                        horizontal: Sizes.dimen_8.w,
                        vertical: Sizes.dimen_4.h,
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(Sizes.dimen_8.w),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(
                            child: ClipRRect(
                              borderRadius: BorderRadius.vertical(
                                  top: Radius.circular(8)),
                              child: movieCast.profilePath == null
                                  ? Container(
                                      height: Sizes.dimen_150.h,
                                      width: Sizes.dimen_150.w,
                                      decoration: BoxDecoration(
                                        image: DecorationImage(
                                          image: AssetImage(
                                              AssetConstants.noImage),
                                        ),
                                      ),
                                    )
                                  : CachedNetworkImage(
                                      height: Sizes.dimen_150.h,
                                      width: Sizes.dimen_160.w,
                                      imageUrl:
                                          '${ApiConstants.BASE_IMAGE_URL}${movieCast.profilePath}',
                                      fit: BoxFit.cover,
                                    ),
                            ),
                          ),
                          Center(
                            child: Text(
                              movieCast.name,
                              overflow: TextOverflow.fade,
                              maxLines: 1,
                              style:
                                  Theme.of(context).textTheme.vulcanBodyText2,
                            ),
                          ),
                          Center(
                            child: Text(
                              movieCast.character,
                              overflow: TextOverflow.fade,
                              maxLines: 1,
                              style: Theme.of(context).textTheme.bodySmall,
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          );
        }
        return SizedBox.shrink();
      },
    );
  }
}
