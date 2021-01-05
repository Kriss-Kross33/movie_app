import 'package:flutter/material.dart';
import '../../../../core/extensions/size_extension.dart';

class LogoWidget extends StatelessWidget {
  final double height;

  const LogoWidget({Key key, this.height})
      : assert(height != null, 'height should not be null'),
        assert(height > 0, 'height should be greater than 0'),
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
