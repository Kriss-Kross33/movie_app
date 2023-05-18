import 'package:flutter/material.dart';
import 'package:movie_app/src/core/constants/size_constants.dart';
import 'package:movie_app/src/core/screenutil/screenutil.dart';

import '../../core/extensions/size_extension.dart';

class MovieAppBar extends StatelessWidget {
  final Widget? leading;
  final Widget? title;
  final Widget? trailing;
  MovieAppBar({
    super.key,
    this.leading,
    this.title,
    this.trailing,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        top: ScreenUtil().statusBarHeight + Sizes.dimen_4.h,
        right: Sizes.dimen_16.w,
        left: Sizes.dimen_16.w,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          leading ?? SizedBox(),
          title ?? SizedBox(),
          trailing ?? SizedBox(),
        ],
      ),
    );
  }
}
