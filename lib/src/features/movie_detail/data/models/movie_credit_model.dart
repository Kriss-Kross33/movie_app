import 'package:json_annotation/json_annotation.dart';

import '../../domain/domain.dart';

part 'movie_cast_model.dart';
part 'movie_credit_model.g.dart';
part 'movie_crew_model.dart';

@JsonSerializable(explicitToJson: true)
class MovieCreditModel {
  int? id;
  List<MovieCastModel> cast;
  List<MovieCrewModel>? crew;

  MovieCreditModel({this.id, required this.cast, this.crew});

  factory MovieCreditModel.fromJson(Map<String, dynamic> json) =>
      _$MovieCreditModelFromJson(json);

  Map<String, dynamic> toJson() => _$MovieCreditModelToJson(this);
}
