import 'package:flutter/material.dart';
import 'package:movie_app/src/core/core.dart';

class BackArrow extends StatelessWidget {
  const BackArrow({
    super.key,
    this.onTap,
  });

  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => onTap ?? Navigator.pop(context),
      child: Icon(
        Icons.arrow_back_ios,
        color: Colors.white,
        size: Sizes.dimen_20.h,
      ),
    );
  }
}
