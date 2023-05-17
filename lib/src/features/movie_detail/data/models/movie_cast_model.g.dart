// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'movie_cast_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MovieCastModel _$MovieCastModelFromJson(Map<String, dynamic> json) =>
    MovieCastModel(
      name: json['name'] as String,
      creditId: json['credit_id'] as String,
      profilePath: json['profile_path'] as String?,
      character: json['character'] as String,
      adult: json['adult'] as bool?,
      castId: json['castId'] as int?,
      gender: json['gender'] as int?,
      id: json['id'] as int?,
      knownForDepartment: json['known_for_department'] as String?,
      popularity: (json['popularity'] as num?)?.toDouble(),
      order: json['order'] as int?,
      originalName: json['originalName'] as String?,
    );

Map<String, dynamic> _$MovieCastModelToJson(MovieCastModel instance) =>
    <String, dynamic>{
      'name': instance.name,
      'credit_id': instance.creditId,
      'profile_path': instance.profilePath,
      'character': instance.character,
      'adult': instance.adult,
      'gender': instance.gender,
      'id': instance.id,
      'known_for_department': instance.knownForDepartment,
      'originalName': instance.originalName,
      'popularity': instance.popularity,
      'castId': instance.castId,
      'order': instance.order,
    };
