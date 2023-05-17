import 'package:json_annotation/json_annotation.dart';

import '../../domain/domain.dart';

part 'movie_detail_model.g.dart';
part 'movie_genre.dart';
part 'production_companies.dart';
part 'production_countries.dart';
part 'spoken_languages.dart';

@JsonSerializable()
class MovieDetailModel extends MovieDetailEntity {
  final bool? adult;
  @JsonKey(name: 'backdrop_path')
  final String backdropPath;
  // final Null belongsToCollection;
  final int? budget;
  final List<MovieGenres>? genres;
  final String? homepage;
  final int id;
  final String? imdbId;
  @JsonKey(name: 'original_language')
  final String? originalLanguage;
  @JsonKey(name: 'original_title')
  final String? originalTitle;
  final String overview;
  final double? popularity;
  @JsonKey(name: 'poster_path')
  final String posterPath;
  @JsonKey(name: 'production_companies')
  final List<ProductionCompanies>? productionCompanies;
  @JsonKey(name: 'production_countries')
  final List<ProductionCountries>? productionCountries;
  @JsonKey(name: 'release_date')
  final String releaseDate;
  final int? revenue;
  final int? runtime;
  @JsonKey(name: 'spoken_languages')
  final List<SpokenLanguages>? spokenLanguages;
  final String? status;
  final String? tagline;
  final String title;
  final bool? video;
  @JsonKey(name: 'vote_average')
  final double voteAverage;
  @JsonKey(name: 'vote_count')
  final int? voteCount;

  MovieDetailModel({
    this.adult,
    required this.backdropPath,
    //  this.belongsToCollection,
    this.budget,
    this.genres,
    this.homepage,
    required this.id,
    this.imdbId,
    this.originalLanguage,
    this.originalTitle,
    required this.overview,
    this.popularity,
    required this.posterPath,
    this.productionCompanies,
    this.productionCountries,
    required this.releaseDate,
    this.revenue,
    this.runtime,
    this.spokenLanguages,
    this.status,
    this.tagline,
    required this.title,
    this.video,
    required this.voteAverage,
    this.voteCount,
  }) : super(
          backdropPath: backdropPath,
          id: id,
          overview: overview,
          posterPath: posterPath,
          releaseDate: releaseDate,
          title: title,
          voteAverage: voteAverage,
        );

  factory MovieDetailModel.fromJson(Map<String, dynamic> json) =>
      _$MovieDetailModelFromJson(json);

  Map<String, dynamic> toJson() => _$MovieDetailModelToJson(this);
}
