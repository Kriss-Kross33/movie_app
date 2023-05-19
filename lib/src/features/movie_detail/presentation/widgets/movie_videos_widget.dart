import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/src/features/movie_detail/domain/domain.dart';
import 'package:movie_app/src/features/movie_detail/presentation/blocs/blocs.dart';

import '../../../../common/common.dart';
import '../../../../core/core.dart';
import '../pages/pages.dart';

class MovieVideosWidget extends StatelessWidget {
  const MovieVideosWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MovieVideoBloc, MovieVideoState>(
      builder: (context, state) {
        if (state is MovieVideoLoadedState &&
            state.videos!.iterator.moveNext()) {
          return Button(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) {
                  return MovieVideoScreen(
                    movieVideoArguments: MovieVideoArguments(
                      videos: state.videos!,
                    ),
                  );
                }),
              );
            },
            text: TranslationConstants.WATCH_TRAILERS,
          );
        }
        return const SizedBox.shrink();
      },
    );
  }
}
