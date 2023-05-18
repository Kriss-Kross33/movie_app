import 'package:equatable/equatable.dart';

class MovieVideoEntity extends Equatable {
  MovieVideoEntity({
    required this.name,
    required this.site,
    required this.type,
    required this.size,
    required this.official,
    required this.key,
  });

  final String name;
  final String site;
  final int size;
  final String type;
  final bool official;
  final String key;

  @override
  List<Object> get props => [
        name,
        site,
        type,
        size,
        official,
        key,
      ];
}
