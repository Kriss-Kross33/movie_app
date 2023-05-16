import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/src/core/di/service_locator.dart';

import '../../domain/domain.dart';
import '../presentation.dart';

class MovieDetailScreen extends StatefulWidget {
  const MovieDetailScreen({
    super.key,
    required this.movieDetailArguments,
  });

  final MovieDetailArguments movieDetailArguments;

  @override
  State<MovieDetailScreen> createState() => _MovieDetailScreenState();
}

class _MovieDetailScreenState extends State<MovieDetailScreen> {
  late MovieDetailBloc _movieDetailBloc;

  @override
  void initState() {
    super.initState();
    _movieDetailBloc = locator<MovieDetailBloc>();
    _movieDetailBloc.add(
      MovieDetailFetchEvent(widget.movieDetailArguments.movieId),
    );
  }

  @override
  void dispose() {
    _movieDetailBloc.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider<MovieDetailBloc>.value(
        value: _movieDetailBloc,
        child: BlocBuilder<MovieDetailBloc, MovieDetailState>(
          builder: (context, state) {
            if (state is MovieDetailLoadingState) {
              return Center(child: CircularProgressIndicator());
            } else if (state is MovieDetailLoadedState) {
              final movie = state.movie;
              return Column(
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
                  )
                ],
              );
            } else if (state is MovieDetailErrorState) {
              return Center(child: Text('Error'));
            } else
              return SizedBox.shrink();
          },
        ),
      ),
    );
  }
}
