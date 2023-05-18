part of 'movie_video_results_model.dart';

@JsonSerializable()
class MovieVideoModel extends MovieVideoEntity {
  @JsonKey(name: 'iso_639_1')
  final String? iso6391;
  @JsonKey(name: 'iso_3166_1')
  final String? iso31661;
  final String name;
  final String key;
  final String site;
  final int size;
  final String type;
  final bool official;
  @JsonKey(name: 'published_at')
  final String? publishedAt;
  final String? id;

  MovieVideoModel({
    this.iso6391,
    this.iso31661,
    required this.name,
    required this.key,
    required this.site,
    required this.size,
    required this.type,
    required this.official,
    this.publishedAt,
    this.id,
  }) : super(
          name: name,
          site: site,
          key: key,
          size: size,
          type: type,
          official: official,
        );

  factory MovieVideoModel.fromJson(Map<String, dynamic> json) =>
      _$MovieVideoModelFromJson(json);

  Map<String, dynamic> toJson() => _$MovieVideoModelToJson(this);
}
