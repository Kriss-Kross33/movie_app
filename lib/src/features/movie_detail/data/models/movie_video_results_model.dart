import 'package:json_annotation/json_annotation.dart';
import 'package:movie_app/src/features/movie_detail/domain/domain.dart';

part 'movie_video_model.dart';
part 'movie_video_results_model.g.dart';

@JsonSerializable(explicitToJson: true)
class MovieVideoResultsModel {
  MovieVideoResultsModel({required this.id, required this.videos});
  final int id;

  @JsonKey(name: 'results')
  final List<MovieVideoModel>? videos;

  factory MovieVideoResultsModel.fromJson(Map<String, dynamic> json) =>
      _$MovieVideoResultsModelFromJson(json);

  Map<String, dynamic> toJson() => _$MovieVideoResultsModelToJson(this);
}
