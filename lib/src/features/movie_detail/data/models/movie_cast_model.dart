part of 'movie_credit_model.dart';

@JsonSerializable()
class MovieCastModel extends MovieCastEntity {
  const MovieCastModel({
    required this.name,
    required this.creditId,
    this.profilePath,
    required this.character,
    this.adult,
    this.castId,
    this.gender,
    this.id,
    this.knownForDepartment,
    this.popularity,
    this.order,
    this.originalName,
  }) : super(
          name: name,
          creditId: creditId,
          profilePath: profilePath,
          character: character,
        );

  final String name;
  @JsonKey(name: 'credit_id')
  final String creditId;
  @JsonKey(name: 'profile_path')
  final String? profilePath;
  final String character;
  final bool? adult;
  final int? gender;
  final int? id;
  @JsonKey(name: 'known_for_department')
  final String? knownForDepartment;

  final String? originalName;
  final double? popularity;

  final int? castId;

  final int? order;

  factory MovieCastModel.fromJson(Map<String, dynamic> json) =>
      _$MovieCastModelFromJson(json);

  Map<String, dynamic> toJson() => _$MovieCastModelToJson(this);
}
