import 'package:flutter/material.dart';
import 'package:movie_app/src/common/widgets/layout/layout.dart';

class ResponsivePadding extends StatelessWidget {
  final EdgeInsetsGeometry phonePadding;
  final EdgeInsetsGeometry tabletPadding;
  final EdgeInsetsGeometry destopPadding;
  final Widget child;

  const ResponsivePadding({
    Key? key,
    required this.phonePadding,
    required this.tabletPadding,
    required this.destopPadding,
    required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ResponsiveLayout(
      phone: Padding(
        padding: phonePadding,
        child: child,
      ),
      tablet: Padding(
        padding: tabletPadding,
        child: child,
      ),
      desktop: Padding(
        padding: destopPadding,
        child: child,
      ),
    );
  }
}
