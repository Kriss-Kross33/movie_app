import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/core.dart';
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
  late MovieCastBloc _movieCastBloc;
  late MovieVideoBloc _movieVideoBloc;

  @override
  void initState() {
    super.initState();
    _movieDetailBloc = locator<MovieDetailBloc>();
    _movieCastBloc = _movieDetailBloc.movieCastBloc;
    _movieVideoBloc = _movieDetailBloc.movieVideoBloc;
    _movieDetailBloc.add(
      MovieDetailFetchEvent(widget.movieDetailArguments.movieId),
    );
  }

  @override
  void dispose() {
    _movieDetailBloc.close();
    _movieCastBloc.close();
    _movieVideoBloc.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: MultiBlocProvider(
        providers: [
          BlocProvider<MovieDetailBloc>.value(
            value: _movieDetailBloc,
          ),
          BlocProvider<MovieCastBloc>.value(
            value: _movieCastBloc,
          ),
          BlocProvider<MovieVideoBloc>.value(
            value: _movieVideoBloc,
          ),
        ],
        child: BlocBuilder<MovieDetailBloc, MovieDetailState>(
          builder: (context, state) {
            if (state is MovieDetailLoadingState) {
              return Center(child: CircularProgressIndicator());
            } else if (state is MovieDetailLoadedState) {
              final movie = state.movie;
              return MovieDetailLoadedWidget(
                  movie: movie,
                  movieDetailArguments: widget.movieDetailArguments);
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
