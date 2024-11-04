import 'package:flutter/cupertino.dart';
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
    final paint = Paint()
      ..color = Colors.white.withOpacity(1.0 - whiteAnimationRemove.value)
      ..style = PaintingStyle.fill;

    final Offset topLeft = Offset( textSize.width - currentLeftX, 0);
    final Offset botRight = Offset( textSize.width - currentRightX, textSize.height);
    final rect = Rect.fromPoints(topLeft, botRight);
    if (whiteAnimationRemove.value < 1.0) canvas.drawRect(rect, paint);
  }

  @override
  bool shouldRepaint(covariant AnimatedTextPainter oldDelegate) {
    return oldDelegate.animationPercent.value != animationPercent.value;
  }
}