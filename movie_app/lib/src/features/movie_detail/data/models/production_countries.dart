part of 'movie_detail_model.dart';

@JsonSerializable()
class ProductionCountries {
  final String? iso31661;
  final String? name;

  ProductionCountries({this.iso31661, this.name});

  factory ProductionCountries.fromJson(Map<String, dynamic> json) =>
      _$ProductionCountriesFromJson(json);

  Map<String, dynamic> toJson() => _$ProductionCountriesToJson(this);
}
