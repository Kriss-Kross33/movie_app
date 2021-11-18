import 'package:flutter/material.dart';
import 'package:movie_app/src/core/localizations/app_localizations.dart';

extension StringExtension on String {
  String intelliTrim() {
    return this.length > 15 ? '${this.substring(0, 15)}...' : this;
  }

  /// Translate a text String.
  String? translate(BuildContext context) {
    return AppLocalizations.of(context)?.translate(this);
  }
}
