import 'package:movie_app/src/features/languages/domain/entities/language_entity.dart';

class LanguageConstants {
  static const List<LanguageEntity> languages = <LanguageEntity>[
    LanguageEntity(code: 'en', value: 'English'),
    LanguageEntity(code: 'fr', value: 'French'),
    LanguageEntity(code: 'es', value: 'Spanish'),
  ];
}
