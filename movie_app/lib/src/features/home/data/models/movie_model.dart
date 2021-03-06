import 'package:movie_app/src/features/home/domain/entities/movie_entity.dart';

class MovieModel extends MovieEntity {
  final String posterPath;
  final bool video;
  final double voteAverage;
  final String overview;
  final String releaseDate;
  final int voteCount;
  final bool adult;
  final String backdropPath;
  final String title;
  final List<int> genreIds;
  final int id;
  final String originalLanguage;
  final String originalTitle;
  final double popularity;
  final String mediaType;

  MovieModel(
      {this.posterPath,
      this.video,
      this.voteAverage,
      this.overview,
      this.releaseDate,
      this.voteCount,
      this.adult,
      this.backdropPath,
      this.title,
      this.genreIds,
      this.id,
      this.originalLanguage,
      this.originalTitle,
      this.popularity,
      this.mediaType})
      : super(
          id: id,
          posterPath: posterPath,
          releaseDate: releaseDate,
          title: title,
          backdropPath: backdropPath,
          overview: overview,
          voteAverage: voteAverage,
        );

  factory MovieModel.fromJson(Map<String, dynamic> json) {
    return MovieModel(
      posterPath: json['poster_path'],
      video: json['video'],
      voteAverage: json['vote_average']?.toDouble() ?? 0.0,
      overview: json['overview'],
      releaseDate: json['release_date'],
      voteCount: json['vote_count'],
      adult: json['adult'],
      backdropPath: json['backdrop_path'],
      title: json['title'],
      genreIds: json['genre_ids'].cast<int>(),
      id: json['id'],
      originalLanguage: json['original_language'],
      originalTitle: json['original_title'],
      popularity: json['popularity']?.toDouble() ?? 0.0,
      mediaType: json['media_type'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['poster_path'] = this.posterPath;
    data['video'] = this.video;
    data['vote_average'] = this.voteAverage;
    data['overview'] = this.overview;
    data['release_date'] = this.releaseDate;
    data['vote_count'] = this.voteCount;
    data['adult'] = this.adult;
    data['backdrop_path'] = this.backdropPath;
    data['title'] = this.title;
    data['genre_ids'] = this.genreIds;
    data['id'] = this.id;
    data['original_language'] = this.originalLanguage;
    data['original_title'] = this.originalTitle;
    data['popularity'] = this.popularity;
    data['media_type'] = this.mediaType;
    return data;
  }
}
