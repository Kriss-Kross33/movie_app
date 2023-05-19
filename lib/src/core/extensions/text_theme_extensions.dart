import 'package:flutter/material.dart';
import 'package:movie_app/src/core/app_color/app_color.dart';

extension ThemeTextExtension on TextTheme {
  TextStyle? get royalBlueSubtitle1 => titleMedium?.copyWith(
        color: AppColor.royalBlue,
        fontWeight: FontWeight.w600,
      );

  TextStyle? get greyDisplayLarge => titleSmall?.copyWith(
        color: Colors.grey,
      );

  TextStyle? get violetLabelLarge => titleMedium?.copyWith(
        color: AppColor.royalBlue,
      );

  TextStyle? get vulcanBodyText2 =>
      bodyMedium?.copyWith(color: AppColor.vulcan, fontWeight: FontWeight.w600);

  TextStyle? get greySubtitle1 => titleMedium?.copyWith(
        color: Colors.grey,
      );

  TextStyle? get violetHeadline6 => titleLarge?.copyWith(
        color: AppColor.violet,
      );

  TextStyle? get greyCaption => bodySmall?.copyWith(
        color: Colors.grey,
      );
}
