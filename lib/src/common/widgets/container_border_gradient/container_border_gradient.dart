import 'package:flutter/material.dart';

class ContainerBorderGradient extends BoxBorder {
  final Gradient gradient;
  final double borderWidth;

  ContainerBorderGradient({required this.gradient, required this.borderWidth});

  @override
  BorderSide get bottom => BorderSide.none;

  @override
  EdgeInsetsGeometry get dimensions => EdgeInsets.all(borderWidth);

  @override
  bool get isUniform => true;

  @override
  void paint(Canvas canvas, Rect rect,
      {TextDirection? textDirection,
      BoxShape shape = BoxShape.rectangle,
      BorderRadius? borderRadius}) {
    final bgPaint = Paint()
      ..isAntiAlias = true
      ..strokeWidth = borderWidth
      ..shader = gradient.createShader(rect)
      ..style = PaintingStyle.stroke;
    switch (shape) {
      case BoxShape.circle:
        _paintCircle(rect: rect, canvas: canvas, paint: bgPaint);
        break;
      case BoxShape.rectangle:
        _paintRRect(
          rect: rect,
          canvas: canvas,
          paint: bgPaint,
          borderRadius: borderRadius,
        );
        break;
      default:
        _paintRect(rect: rect, canvas: canvas, paint: bgPaint);
    }
  }

  void _paintRect(
      {required Rect rect, required Canvas canvas, required Paint paint}) {
    canvas.drawRect(rect.deflate(borderWidth / 2), paint);
  }

  void _paintRRect({
    required Rect rect,
    required Canvas canvas,
    required Paint paint,
    required BorderRadius? borderRadius,
  }) {
    final rrect = borderRadius?.toRRect(rect).deflate(borderWidth / 2);
    canvas.drawRRect(rrect!, paint);
  }

  void _paintCircle(
      {required Rect rect, required Canvas canvas, required Paint paint}) {
    canvas.drawCircle(rect.center, rect.shortestSide - borderWidth, paint);
  }

  @override
  ShapeBorder scale(double t) {
    return this;
  }

  @override
  BorderSide get top => BorderSide.none;
}
