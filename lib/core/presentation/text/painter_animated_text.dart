import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:vmb_portfolio/core/extensions/offset.dart';
import 'package:vmb_portfolio/core/extensions/path.dart';
import '../../constants/custom_colors.dart';

class AnimatedTextPainter extends CustomPainter {
  final Animation<double> animationPercent;
  final Animation<double> whiteAnimationDisplay;
  final Animation<double> whiteAnimationRemove;
  final Size textSize;
  final bool invertDirection;
  final double fontSize;
  final FontWeight fontWeight;
  final String text;
  final double? textMaxWidth;
  List<LineMetrics> lineMetricsList;

  AnimatedTextPainter({
    required this.animationPercent,
    required this.whiteAnimationDisplay,
    required this.whiteAnimationRemove,
    required this.textSize,
    required this.text,
    required this.fontSize,
    required this.fontWeight,
    this.invertDirection = false,
    this.textMaxWidth,
    required Listenable repaint,
    required this.lineMetricsList,
  }) : super(repaint: repaint);

  @override
  void paint(Canvas canvas, Size size) {
    final rect = Rect.fromPoints(Offset(0, 0), Offset(textSize.width, textSize.height));
    final paint = Paint()
      ..imageFilter = ImageFilter.blur(sigmaX: 1.3, sigmaY: 1.3, tileMode: TileMode.decal)
      ..shader = const LinearGradient(
        stops: [ 0.2, 0.7 ],
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
        colors: [
          MyColors.visibleText,
          Color(0xffeeffff),
        ],
      ).createShader(rect)
      ..style = PaintingStyle.fill
    ;

    final path = Path();
    for (var i = 0; i < lineMetricsList.length; i++) {
      final lineMetrics = lineMetricsList[i];
      final lineWidth = lineMetrics.width;
      final lineLeftX = whiteAnimationDisplay.value * lineMetrics.width;
      final lineRightX = whiteAnimationRemove.value * lineMetrics.width;
      final Offset lineTopLeft = Offset( lineLeftX, i * lineMetrics.height);
      final Offset lineTopRight = Offset( lineRightX, i * lineMetrics.height);
      final Offset lineBotRight = lineTopRight.plusY(lineMetrics.height);
      final Offset lineBotLeft = lineTopLeft.plusY(lineMetrics.height);
      path.moveToOffset(lineTopLeft);
      path.lineToOffset(lineTopRight);
      path.lineToOffset(lineBotRight);
      path.lineToOffset(lineBotLeft);
      path.close();
    }
    if (whiteAnimationRemove.value < 1.0) canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant AnimatedTextPainter oldDelegate) {
    return oldDelegate.animationPercent.value != animationPercent.value;
  }
}