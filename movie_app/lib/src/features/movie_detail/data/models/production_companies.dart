part of 'movie_detail_model.dart';

@JsonSerializable()
class ProductionCompanies {
  final int? id;
  final String? logoPath;
  final String? name;
  final String? originCountry;

  ProductionCompanies({this.id, this.logoPath, this.name, this.originCountry});

  factory ProductionCompanies.fromJson(Map<String, dynamic> json) =>
      _$ProductionCompaniesFromJson(json);

  Map<String, dynamic> toJson() => _$ProductionCompaniesToJson(this);
}
