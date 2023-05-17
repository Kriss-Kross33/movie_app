import 'package:json_annotation/json_annotation.dart';
import 'package:movie_app/src/features/movie_detail/data/models/models.dart';

part 'movie_credit_model.g.dart';

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
