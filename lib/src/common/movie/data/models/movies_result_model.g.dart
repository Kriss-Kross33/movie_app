// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'movies_result_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MoviesResultModel _$MoviesResultModelFromJson(Map<String, dynamic> json) =>
    MoviesResultModel(
      movies: (json['results'] as List<dynamic>?)
          ?.map((e) => MovieModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$MoviesResultModelToJson(MoviesResultModel instance) =>
    <String, dynamic>{
      'results': instance.movies?.map((e) => e.toJson()).toList(),
    };
