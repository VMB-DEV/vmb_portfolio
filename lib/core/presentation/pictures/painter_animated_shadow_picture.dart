import 'dart:async';

import 'package:flutter/material.dart';
import 'dart:ui' as ui;

class AnimatedShadowPicture extends CustomPainter {
  final ui.Image image;
  final double blur;
  final Animation<double> animationPercent;

  AnimatedShadowPicture({
    required this.image,
    required this.animationPercent,
    this.blur = 2.0,
    required Listenable repaint,
  }) : super(repaint: repaint);

  @override
  void paint(Canvas canvas, Size size) {
    final double currentBlur = animationPercent.value * blur;

    Paint blurPaint = Paint()
      ..imageFilter = ui.ImageFilter.blur(sigmaX: currentBlur, sigmaY: currentBlur);

    canvas.saveLayer(
      Rect.fromLTWH(0, 0, size.width, size.height),
      blurPaint,
    );
    paintImage(
      canvas: canvas,
      rect: Rect.fromLTWH(0, 0, size.width, size.height),
      image: image,
      fit: BoxFit.cover,
    );
    canvas.restore();

    paintImage(
      canvas: canvas,
      rect: Rect.fromLTWH(0, 0, size.width, size.height),
      image: image,
      fit: BoxFit.cover,
    );
  }

  @override
  bool shouldRepaint(covariant AnimatedShadowPicture oldDelegate) {
    return oldDelegate.animationPercent.value != animationPercent.value;
  }
}