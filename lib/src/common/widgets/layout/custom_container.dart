part of 'responsive_container.dart';

class CustomContainer extends StatelessWidget {
  final double? width;
  final double? height;
  final Widget? child;
  final BoxDecoration? decoration;

  const CustomContainer({
    Key? key,
    this.child,
    this.width,
    this.height,
    this.decoration,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      decoration: decoration,
      child: child,
    );
  }
}
