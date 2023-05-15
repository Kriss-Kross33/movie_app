import 'package:equatable/equatable.dart';

class LanguageEntity extends Equatable {
  final String code;
  final String value;

  const LanguageEntity({
    required this.code,
    required this.value,
  });

  @override
  List<Object> get props => [code, value];
}
