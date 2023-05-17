import 'package:equatable/equatable.dart';

class MovieDetailArguments extends Equatable {
  final int movieId;

  MovieDetailArguments({required this.movieId});

  @override
  List<Object> get props => [movieId];
}
