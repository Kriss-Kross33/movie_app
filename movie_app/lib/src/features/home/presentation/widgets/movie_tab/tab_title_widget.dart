import 'package:flutter/material.dart';
import 'package:movie_app/src/core/app_color/app_color.dart';
import 'package:movie_app/src/core/constants/size_constants.dart';

import '../../../../../core/extensions/size_extension.dart';
import '../../../../../core/extensions/string_extensions.dart';
import '../../../../../core/extensions/text_theme_extensions.dart';

class TabTitleWidget extends StatelessWidget {
  final String title;
  final VoidCallback? onTap;
  final bool isSelected;

  const TabTitleWidget({
    Key? key,
    required this.title,
    required this.onTap,
    required this.isSelected,
  }) : super(key: key);

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
          title.translate(context) ?? title, // 'popular', 'now', 'soon'
          style: isSelected
              ? Theme.of(context).textTheme.royalBlueSubtitle1
              : Theme.of(context).textTheme.titleMedium,
        ),
      ),
    );
  }
}
