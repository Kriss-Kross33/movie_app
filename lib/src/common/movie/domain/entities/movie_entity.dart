import 'package:equatable/equatable.dart';

class MovieEntity extends Equatable {
  final String? posterPath;
  final int id;
  final String? backdropPath;
  final String title;
  final num? voteAverage;
  final String? releaseDate;
  final String? overview;

  MovieEntity({
    this.posterPath,
    required this.id,
    required this.backdropPath,
    required this.title,
    required this.voteAverage,
    required this.releaseDate,
    this.overview,
  });

  @override
  List<Object> get props => [id, title];

  @override
  bool get stringify => true;
}
