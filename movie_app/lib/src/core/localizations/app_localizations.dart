import 'dart:convert';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:movie_app/src/core/constants/language_constants.dart';

class AppLocalizations {
  final Locale locale;

  AppLocalizations(this.locale);

  static const LocalizationsDelegate<AppLocalizations> delegate =
      _ApplocalizationDelegate();

  Map<String, String> _localizedStrings;

  static AppLocalizations of(context) =>
      Localizations.of<AppLocalizations>(context, AppLocalizations);

  Future<bool> load() async {
    final jsonString = await rootBundle
        .loadString('assets/languages/${locale.languageCode}.json');
    final Map<String, dynamic> jsonMap = json.decode(jsonString);

    _localizedStrings =
        jsonMap.map((key, value) => MapEntry(key, value.toString()));
    return true;
  }

  String translate(String key) {
    return _localizedStrings[key];
  }
}

class _ApplocalizationDelegate extends LocalizationsDelegate<AppLocalizations> {
  const _ApplocalizationDelegate();

  @override
  bool isSupported(Locale locale) {
    return LanguageConstants.languages
        .map((language) => language.code)
        .toList()
        .contains(locale.languageCode);
  }

  @override
  Future<AppLocalizations> load(Locale locale) async {
    AppLocalizations localizations = AppLocalizations(locale);
    await localizations.load();
    return localizations;
  }

  @override
  bool shouldReload(covariant LocalizationsDelegate<AppLocalizations> old) =>
      false;
}
