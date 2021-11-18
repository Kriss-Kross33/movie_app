import 'package:flutter/material.dart';
import 'package:movie_app/src/core/constants/size_constants.dart';

import '../../../../../core/extensions/size_extension.dart';

class NavigationDrawerSublistItem extends StatelessWidget {
  final String title;
  final VoidCallback? onPressed;

  const NavigationDrawerSublistItem(
      {Key? key, required this.title, required this.onPressed})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        decoration: BoxDecoration(
          boxShadow: <BoxShadow>[
            new BoxShadow(
              color: Theme.of(context).primaryColor.withOpacity(0.7),
              blurRadius: 2,
            ),
          ],
        ),
        child: ListTile(
          contentPadding: EdgeInsets.symmetric(horizontal: Sizes.dimen_32.w),
          title: Text(title, style: Theme.of(context).textTheme.subtitle1),
        ),
      ),
    );
  }
}
