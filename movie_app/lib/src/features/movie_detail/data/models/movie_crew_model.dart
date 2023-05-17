import 'package:json_annotation/json_annotation.dart';

part 'movie_crew_model.g.dart';

@JsonSerializable()
class MovieCrewModel {
  final bool? adult;
  final int? gender;
  final int? id;
  @JsonKey(name: 'known_for_department')
  final String? knownForDepartment;
  final String? name;
  @JsonKey(name: 'original_name')
  final String? originalName;
  final double? popularity;
  @JsonKey(name: 'profile_path')
  final String? profilePath;
  @JsonKey(name: 'credit_id')
  final String? creditId;
  final String? department;
  final String? job;

  MovieCrewModel(
      {this.adult,
      this.gender,
      this.id,
      this.knownForDepartment,
      this.name,
      this.originalName,
      this.popularity,
      this.profilePath,
      this.creditId,
      this.department,
      this.job});

  factory MovieCrewModel.fromJson(Map<String, dynamic> json) =>
      _$MovieCrewModelFromJson(json);

  Map<String, dynamic> toJson() => _$MovieCrewModelToJson(this);
}
