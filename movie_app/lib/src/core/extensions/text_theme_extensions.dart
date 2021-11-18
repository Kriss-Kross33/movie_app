import 'package:flutter/material.dart';
import 'package:movie_app/src/core/app_color/app_color.dart';

extension ThemeTextExtension on TextTheme {
  TextStyle? get royalBlueSubtitle1 => subtitle1?.copyWith(
        color: AppColor.royalBlue,
        fontWeight: FontWeight.w600,
      );
}
