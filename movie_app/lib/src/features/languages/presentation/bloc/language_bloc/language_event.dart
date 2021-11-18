part of 'language_bloc.dart';

abstract class LanguageEvent extends Equatable {
  const LanguageEvent();

  @override
  List<Object> get props => [];
}

class ToogleLanguageEvent extends LanguageEvent {
  final LanguageEntity language;
  ToogleLanguageEvent({required this.language});

  @override
  List<Object> get props => [language.code];
}
