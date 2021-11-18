import 'package:flutter/material.dart';

class LogoWidget extends StatelessWidget {
  final double height;

  const LogoWidget({Key? key, required this.height})
      : assert(height > 0, 'height should be greater than 0'),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      'assets/images/pngs/logo.png',
      color: Colors.white,
      height: height,
    );
  }
}
