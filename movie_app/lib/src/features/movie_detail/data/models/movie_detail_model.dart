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
  final String backdropPath;
  // final Null belongsToCollection;
  final int? budget;
  final List<MovieGenres>? genres;
  final String? homepage;
  final int id;
  final String? imdbId;
  final String? originalLanguage;
  final String? originalTitle;
  final String overview;
  final double? popularity;
  final String posterPath;
  final List<ProductionCompanies>? productionCompanies;
  final List<ProductionCountries>? productionCountries;
  final String releaseDate;
  final int? revenue;
  final int? runtime;
  final List<SpokenLanguages>? spokenLanguages;
  final String? status;
  final String? tagline;
  final String title;
  final bool? video;
  final double voteAverage;
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
