import 'package:flutter/material.dart';
import 'package:movie_app/src/common/widgets/layout/layout.dart';

part 'custom_container.dart';

class ResponsiveContainer extends StatelessWidget {
  final Size phoneSize;
  final Size tabletSize;
  final Size desktopSize;
  final Widget? child;
  final BoxDecoration? decoration;

  const ResponsiveContainer({
    Key? key,
    required this.phoneSize,
    required this.tabletSize,
    required this.desktopSize,
    required this.child,
    this.decoration,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ResponsiveLayout(
      phone: CustomContainer(
        width: phoneSize.width,
        height: phoneSize.height,
        decoration: decoration,
        child: child,
      ),
      tablet: CustomContainer(
        width: tabletSize.width,
        height: tabletSize.height,
        decoration: decoration,
        child: child,
      ),
      desktop: CustomContainer(
        width: desktopSize.width,
        height: desktopSize.height,
        decoration: decoration,
        child: child,
      ),
    );
  }
}
