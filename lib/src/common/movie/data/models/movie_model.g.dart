// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'movie_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MovieModel _$MovieModelFromJson(Map<String, dynamic> json) => MovieModel(
      posterPath: json['poster_path'] as String,
      video: json['video'] as bool?,
      voteAverage: (json['vote_average'] as num?)?.toDouble(),
      overview: json['overview'] as String?,
      releaseDate: json['releaseDate'] as String?,
      voteCount: json['vote_count'] as int?,
      adult: json['adult'] as bool?,
      backdropPath: json['backdrop_path'] as String?,
      title: json['title'] as String,
      genreIds:
          (json['genre_ids'] as List<dynamic>?)?.map((e) => e as int).toList(),
      id: json['id'] as int,
      originalLanguage: json['original_language'] as String?,
      originalTitle: json['original_title'] as String?,
      popularity: (json['popularity'] as num?)?.toDouble(),
      mediaType: json['mediaType'] as String?,
    );

Map<String, dynamic> _$MovieModelToJson(MovieModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'video': instance.video,
      'vote_count': instance.voteCount,
      'vote_average': instance.voteAverage,
      'title': instance.title,
      'releaseDate': instance.releaseDate,
      'original_language': instance.originalLanguage,
      'original_title': instance.originalTitle,
      'genre_ids': instance.genreIds,
      'backdrop_path': instance.backdropPath,
      'adult': instance.adult,
      'overview': instance.overview,
      'poster_path': instance.posterPath,
      'popularity': instance.popularity,
      'mediaType': instance.mediaType,
    };
