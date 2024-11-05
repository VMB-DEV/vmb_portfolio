import 'dart:ui';
import 'package:flutter/material.dart';

class AnimatedTextPainter extends CustomPainter {
  final Animation<double> animationPercent;
  final Animation<double> whiteAnimationDisplay;
  final Animation<double> whiteAnimationRemove;
  final Size textSize;
  final bool invertDirection;

  AnimatedTextPainter({
    required this.animationPercent,
    required this.whiteAnimationDisplay,
    required this.whiteAnimationRemove,
    required this.textSize,
    this.invertDirection = false,
    required Listenable repaint,
  }) : super(repaint: repaint);

  @override
  void paint(Canvas canvas, Size size) {
    final currentLeftX = whiteAnimationDisplay.value * textSize.width;
    final currentRightX = whiteAnimationRemove.value * textSize.width;
    final Offset topLeft = Offset( textSize.width - currentLeftX, 0);
    final Offset botRight = Offset( textSize.width - currentRightX, textSize.height);
    final rect = Rect.fromPoints(topLeft, botRight);
    final paint = Paint()
      ..imageFilter = ImageFilter.blur(sigmaX: 1.2, sigmaY: 1.2, tileMode: TileMode.decal)
      ..color = Colors.white
      ..style = PaintingStyle.fill
    ;

    if (whiteAnimationRemove.value < 1.0) canvas.drawRect(rect, paint);
  }

  @override
  bool shouldRepaint(covariant AnimatedTextPainter oldDelegate) {
    return oldDelegate.animationPercent.value != animationPercent.value;
  }
}