import 'package:flutter/material.dart';
import 'package:movie_app/src/core/core.dart';

class Button extends StatelessWidget {
  final String text;
  final VoidCallback? onPressed;

  const Button({
    Key? key,
    required this.text,
    required this.onPressed,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      height: Sizes.dimen_50.h,
      padding: EdgeInsets.symmetric(horizontal: Sizes.dimen_16.w),
      margin: EdgeInsets.symmetric(vertical: Sizes.dimen_20.h),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            AppColor.royalBlue,
            AppColor.violet,
          ],
        ),
        borderRadius: BorderRadius.circular(Sizes.dimen_20.w),
      ),
      child: TextButton(
        onPressed: onPressed,
        child: Text(
          text.translate(context) ?? text,
          style: Theme.of(context).textTheme.labelLarge,
        ),
      ),
    );
  }
}
