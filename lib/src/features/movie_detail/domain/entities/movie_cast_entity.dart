import 'package:equatable/equatable.dart';

class MovieCastEntity extends Equatable {
  const MovieCastEntity({
    required this.name,
    required this.creditId,
    this.profilePath,
    required this.character,
  });

  final String name;
  final String creditId;
  final String? profilePath;
  final String character;

  @override
  List<Object?> get props => [name, creditId, profilePath, character];
}
