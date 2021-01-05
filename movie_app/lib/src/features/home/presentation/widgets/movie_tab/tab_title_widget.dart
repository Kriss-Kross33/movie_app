import 'package:flutter/material.dart';
import 'package:movie_app/src/core/app_color/app_color.dart';
import 'package:movie_app/src/core/constants/size_constants.dart';
import '../../../../../core/extensions/text_theme_extensions.dart';
import '../../../../../core/extensions/size_extension.dart';

class TabTitleWidget extends StatelessWidget {
  final String title;
  final Function onTap;
  final bool isSelected;

  const TabTitleWidget({
    Key key,
    @required this.title,
    @required this.onTap,
    @required this.isSelected,
  })  : assert(title != null, 'title should not be null'),
        assert(onTap != null, 'onTap should not be null'),
        assert(isSelected != null, 'isSelected should not be null'),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: Colors.transparent,
          border: Border(
              bottom: BorderSide(
            color: isSelected ? AppColor.royalBlue : Colors.transparent,
            width: Sizes.dimen_1.h,
          )),
        ),
        child: Text(
          title,
          style: isSelected
              ? Theme.of(context).textTheme.royalBlueSubtitle1
              : Theme.of(context).textTheme.subtitle1,
        ),
      ),
    );
  }
}
