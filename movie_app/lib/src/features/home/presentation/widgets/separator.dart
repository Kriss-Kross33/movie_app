import 'package:flutter/material.dart';
import 'package:movie_app/src/core/app_color/app_color.dart';
import 'package:movie_app/src/core/constants/size_constants.dart';
import '../../../../core/extensions/size_extension.dart';

class Separator extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: Sizes.dimen_1.h,
      width: Sizes.dimen_80.w,
      padding: EdgeInsets.only(
        top: Sizes.dimen_2.h,
        bottom: Sizes.dimen_6.h,
      ),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.all(
            Radius.circular(Sizes.dimen_1.h),
          ),
          gradient: LinearGradient(colors: <Color>[
            AppColor.violet,
            AppColor.royalBlue,
          ])),
    );
  }
}
