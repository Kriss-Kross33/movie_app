import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:movie_app/src/common/movie/data/data.dart';

part 'movies_result_model.g.dart';

@JsonSerializable(explicitToJson: true)
class MoviesResultModel extends Equatable {
  @JsonKey(name: 'results')
  final List<MovieModel>? movies;

  MoviesResultModel({
    required this.movies,
  });

  factory MoviesResultModel.fromJson(Map<String, dynamic> json) =>
      _$MoviesResultModelFromJson(json);

  Map<String, dynamic> toJson() => _$MoviesResultModelToJson(this);

  @override
  List<Object?> get props => [movies];
}
