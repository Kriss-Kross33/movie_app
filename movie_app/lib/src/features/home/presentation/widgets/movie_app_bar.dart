import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:movie_app/src/core/constants/size_constants.dart';
import 'package:movie_app/src/core/screenutil/screenutil.dart';
import 'package:movie_app/src/features/home/presentation/widgets/logo_widget.dart';
import '../../../../core/extensions/size_extension.dart';

class MovieAppBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        top: ScreenUtil.statusBarHeight + Sizes.dimen_4.h,
        right: Sizes.dimen_16.w,
        left: Sizes.dimen_16.w,
      ),
      child: Row(
        children: <Widget>[
          IconButton(
            icon: SvgPicture.asset(
              'assets/images/svgs/menu.svg',
              height: Sizes.dimen_12.h,
            ),
            onPressed: () {
              Scaffold.of(context).openDrawer();
            },
          ),
          Expanded(
            child: const LogoWidget(
              height: Sizes.dimen_14,
            ),
          ),
          IconButton(
            icon: Icon(
              Icons.search,
              color: Colors.white,
              size: Sizes.dimen_12.h,
            ),
            onPressed: () {},
          ),
        ],
      ),
    );
  }
}
