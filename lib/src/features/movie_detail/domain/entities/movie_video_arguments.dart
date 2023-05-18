import 'package:equatable/equatable.dart';
import 'package:movie_app/src/features/movie_detail/domain/entities/entities.dart';

class MovieVideoArguments extends Equatable {
  MovieVideoArguments({required this.videos});

  final List<MovieVideoEntity> videos;

  @override
  List<Object> get props => [videos];
}
