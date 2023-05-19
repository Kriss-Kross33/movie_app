import 'package:json_annotation/json_annotation.dart';
import 'package:movie_app/src/common/movie/domain/entities/movie_entity.dart';

part 'movie_model.g.dart';

@JsonSerializable(explicitToJson: true)
class MovieModel extends MovieEntity {
  final int id;
  final bool? video;
  @JsonKey(name: 'vote_count')
  final int? voteCount;
  @JsonKey(name: 'vote_average')
  final double? voteAverage;
  final String title;
  final String? releaseDate;
  @JsonKey(name: 'original_language')
  final String? originalLanguage;
  @JsonKey(name: 'original_title')
  final String? originalTitle;
  @JsonKey(name: 'genre_ids')
  final List<int>? genreIds;
  @JsonKey(name: 'backdrop_path')
  final String? backdropPath;
  final bool? adult;
  final String? overview;
  @JsonKey(name: 'poster_path')
  final String? posterPath;
  final double? popularity;
  final String? mediaType;

  MovieModel({
    this.posterPath,
    this.video,
    this.voteAverage,
    this.overview,
    this.releaseDate,
    this.voteCount,
    this.adult,
    this.backdropPath,
    required this.title,
    this.genreIds,
    required this.id,
    this.originalLanguage,
    this.originalTitle,
    this.popularity,
    this.mediaType,
  }) : super(
          id: id,
          posterPath: posterPath,
          releaseDate: releaseDate,
          title: title,
          backdropPath: backdropPath,
          overview: overview,
          voteAverage: voteAverage,
        );

  factory MovieModel.fromJson(Map<String, dynamic> json) =>
      _$MovieModelFromJson(json);

  Map<String, dynamic> toJson() => _$MovieModelToJson(this);
}
