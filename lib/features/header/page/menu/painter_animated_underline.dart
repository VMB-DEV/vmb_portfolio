import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:vmb_portfolio/core/extensions/offset.dart';
import 'package:vmb_portfolio/core/extensions/path.dart';

class AnimatedUnderlinePainter extends CustomPainter {
  final String text;
  // final AnimationController animation;
  final Animation<double> animation;
  final double fontSize;


  AnimatedUnderlinePainter({
    required this.fontSize,
    required this.text,
    required this.animation,
    required Listenable repaint,
  }) : super(repaint: repaint);

  @override
  void paint(Canvas canvas, Size size) {
    final Color endColor = Color.lerp(
        Colors.transparent,
        Colors.white,
        animation.value,
    )!;
    final Color startColor = Color.lerp(
        Colors.transparent,
        Colors.yellow.shade100,
        (animation.value * 2).clamp(0.0, 1.0)
    )!;
    final allRect = Rect.fromLTWH(0, 0, size.width, size.height);
    final paint = Paint()
      ..style = PaintingStyle.stroke
      // ..strokeWidth = 2
      ..strokeWidth = size.height * 0.1
      ..strokeJoin = StrokeJoin.round
      ..shader = LinearGradient(
        stops: const [ 0.0, 0.90 ],
        begin: Alignment.centerLeft,
        end: Alignment.centerRight,
        colors: [ startColor, endColor, ],
      ).createShader(allRect)
      ..maskFilter = MaskFilter.blur(BlurStyle.normal, size.height * 0.03)
    ;

    final Offset start = allRect.bottomLeft.plusX(size.width * 0.01);
    final Offset end = allRect.bottomRight;
    canvas.drawLine(start, end, paint);
  }

  @override
  bool shouldRepaint(covariant AnimatedUnderlinePainter oldDelegate) {
    return oldDelegate.animation.value != animation.value;
  }
}