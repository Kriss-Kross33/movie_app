part of 'movie_detail_model.dart';

@JsonSerializable()
class MovieGenres {
  final int? id;
  final String? name;

  MovieGenres({this.id, this.name});

  factory MovieGenres.fromJson(Map<String, dynamic> json) =>
      _$MovieGenresFromJson(json);

  Map<String, dynamic> toJson() => _$MovieGenresToJson(this);
}
