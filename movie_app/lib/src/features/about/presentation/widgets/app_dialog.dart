import 'package:flutter/material.dart';
import 'package:movie_app/src/core/app_color/app_color.dart';
import 'package:movie_app/src/core/constants/size_constants.dart';
import 'package:movie_app/src/core/constants/translation_constants.dart';
import 'package:movie_app/src/core/widgets/button.dart';

import '../../../../core/extensions/size_extension.dart';
import '../../../../core/extensions/string_extensions.dart';

class AppDialog extends StatelessWidget {
  final String title, description, buttonText;
  final Widget? child;

  const AppDialog({
    Key? key,
    required this.title,
    required this.description,
    required this.buttonText,
    this.child,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: AppColor.vulcan,
      elevation: Sizes.dimen_32.w,
      insetPadding: EdgeInsets.all(Sizes.dimen_32.w),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(Sizes.dimen_10.w),
        ),
      ),
      child: Container(
        padding: EdgeInsets.only(
          top: Sizes.dimen_5.h,
          left: Sizes.dimen_16.w,
          right: Sizes.dimen_16.w,
        ),
        decoration: BoxDecoration(
          boxShadow: <BoxShadow>[
            BoxShadow(
              color: AppColor.vulcan,
              blurRadius: Sizes.dimen_16,
            ),
          ],
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Text(
              title.translate(context) ?? title,
              style: Theme.of(context).textTheme.headlineSmall,
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: Sizes.dimen_10.h),
              child: Text(
                description.translate(context) ?? description,
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.bodyMedium,
              ),
            ),
            if (child != null)
              Padding(
                padding: EdgeInsets.only(bottom: Sizes.dimen_8.h),
                child: child,
              ),
            Button(
              text: TranslationConstants.OKAY,
              onPressed: () => Navigator.pop(context),
            ),
          ],
        ),
      ),
    );
  }
}
