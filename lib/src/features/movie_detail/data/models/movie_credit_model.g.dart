// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'movie_credit_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MovieCreditModel _$MovieCreditModelFromJson(Map<String, dynamic> json) =>
    MovieCreditModel(
      id: json['id'] as int?,
      cast: (json['cast'] as List<dynamic>)
          .map((e) => MovieCastModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      crew: (json['crew'] as List<dynamic>?)
          ?.map((e) => MovieCrewModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$MovieCreditModelToJson(MovieCreditModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'cast': instance.cast.map((e) => e.toJson()).toList(),
      'crew': instance.crew?.map((e) => e.toJson()).toList(),
    };

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

MovieCrewModel _$MovieCrewModelFromJson(Map<String, dynamic> json) =>
    MovieCrewModel(
      adult: json['adult'] as bool?,
      gender: json['gender'] as int?,
      id: json['id'] as int?,
      knownForDepartment: json['known_for_department'] as String?,
      name: json['name'] as String?,
      originalName: json['original_name'] as String?,
      popularity: (json['popularity'] as num?)?.toDouble(),
      profilePath: json['profile_path'] as String?,
      creditId: json['credit_id'] as String?,
      department: json['department'] as String?,
      job: json['job'] as String?,
    );

Map<String, dynamic> _$MovieCrewModelToJson(MovieCrewModel instance) =>
    <String, dynamic>{
      'adult': instance.adult,
      'gender': instance.gender,
      'id': instance.id,
      'known_for_department': instance.knownForDepartment,
      'name': instance.name,
      'original_name': instance.originalName,
      'popularity': instance.popularity,
      'profile_path': instance.profilePath,
      'credit_id': instance.creditId,
      'department': instance.department,
      'job': instance.job,
    };
