import 'package:flutter/material.dart';

class ResponsiveLayout extends StatelessWidget {
  const ResponsiveLayout({
    super.key,
    required this.phone,
    required this.tablet,
    required this.desktop,
  });

  final Widget phone;
  final Widget tablet;
  final Widget desktop;

  static const int phoneLimit = 650;
  static const int tabletLimit = 1100;

  static bool isPhone(BuildContext context) =>
      MediaQuery.of(context).size.width < phoneLimit;

  static bool isTablet(BuildContext context) =>
      MediaQuery.of(context).size.width >= phoneLimit &&
      MediaQuery.of(context).size.width < tabletLimit;

  static bool isDesktop(BuildContext context) =>
      MediaQuery.of(context).size.width >= tabletLimit;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        if (constraints.maxWidth >= tabletLimit) {
          return desktop;
        } else if (constraints.maxWidth < tabletLimit &&
            constraints.maxWidth >= phoneLimit) {
          return tablet;
        }
        return phone;
      },
    );
  }
}
