import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

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

  AnimatedTextPainter({
    required this.animationPercent,
    required this.whiteAnimationDisplay,
    required this.whiteAnimationRemove,
    required this.textSize,
    required this.text,
    required this.fontSize,
    required this.fontWeight,
    this.invertDirection = false,
    required Listenable repaint,
  }) : super(repaint: repaint);

  @override
  void paint(Canvas canvas, Size size) {
    final textSize = getTextSize(text);
    final currentLeftX = whiteAnimationDisplay.value * textSize.width;
    final currentRightX = whiteAnimationRemove.value * textSize.width;
    final Offset topLeft = Offset( invertDirection ? textSize.width - currentLeftX : currentLeftX, 0);
    final Offset botRight = Offset( invertDirection ? textSize.width - currentRightX : currentRightX, textSize.height);
    final rect = Rect.fromPoints(topLeft, botRight);
    final paint = Paint()
      ..imageFilter = ImageFilter.blur(sigmaX: 1.3, sigmaY: 1.3, tileMode: TileMode.decal)
      ..color = Colors.white
      ..shader = const LinearGradient(
        stops: [ 0.2, 0.7 ],
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
        colors: [
          MyColors.visibleText,
          Color(0xeeeeffff),
        ],
      ).createShader(rect)
      ..style = PaintingStyle.fill
    ;

    if (whiteAnimationRemove.value < 1.0) canvas.drawRect(rect, paint);
  }

  Size getTextSize(String text) {
    TextPainter textPainter = TextPainter()
      ..text = TextSpan(text: text, style: GoogleFonts.rajdhani(fontWeight: fontWeight, fontSize: fontSize))
      ..textDirection = TextDirection.ltr
      ..layout(minWidth: 0, maxWidth: double.infinity);

    TextPainter textPainter2 = TextPainter()
      ..text = TextSpan(text: text, style: TextStyle(fontWeight: fontWeight, fontSize: fontSize))
      ..textDirection = TextDirection.ltr
      ..layout(minWidth: 0, maxWidth: double.infinity);

    textPainter.layout();
    textPainter2.layout();

    return Size((textPainter.size.width + textPainter2.size.width) / 2, (textPainter.size.height + textPainter2.size.height) / 2);
  }

  @override
  bool shouldRepaint(covariant AnimatedTextPainter oldDelegate) {
    return oldDelegate.animationPercent.value != animationPercent.value;
  }
}