import 'package:flutter/material.dart';
import 'package:movie_app/src/core/core.dart';

class AuthTextFormField extends StatelessWidget {
  final double height;
  final String hintText;
  final TextInputType? keyboardType;
  final bool obscureText;
  final String? errorText;
  final void Function(String)? onChanged;
  final Widget? suffixIcon;

  const AuthTextFormField({
    super.key,
    this.height = 60,
    this.obscureText = false,
    required this.hintText,
    this.keyboardType,
    this.errorText,
    this.onChanged,
    this.suffixIcon,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      child: TextFormField(
        obscureText: obscureText,
        keyboardType: keyboardType,
        onChanged: onChanged,
        decoration: InputDecoration(
          suffixIcon: suffixIcon,
          hintText: hintText,
          errorText: errorText,
          hintStyle: Theme.of(context).textTheme.bodyMedium,
          contentPadding: EdgeInsets.only(
            left: 20,
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(30),
            borderSide: BorderSide(
              color: AppColor.violet,
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: AppColor.royalBlue,
            ),
            borderRadius: BorderRadius.circular(30),
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: AppColor.royalBlue,
            ),
            borderRadius: BorderRadius.circular(30),
          ),
        ),
      ),
    );
  }
}
