import 'dart:ui' as ui;
import 'package:flutter/material.dart';
import '../../sizes_catcher.dart';

class SlidingIconPainter extends CustomPainter {
  final CatcherSizes sizes;
  final Animation<double> animationMovement;
  final Animation<double> animationAppearance;
  final Animation<double> animationDisappearance;
  final ui.Image icon;
  SlidingIconPainter({
    required this.sizes,
    required this.animationMovement,
    required this.animationAppearance,
    required this.animationDisappearance,
    required this.icon,
    required Listenable repaint,
  }) : super(repaint: repaint);

  @override
  void paint(ui.Canvas canvas, Size size) {
    final opacity = animationDisappearance.value > 0.0 ? (1.0 - animationDisappearance.value) : animationAppearance.value;
    final iconSize = sizes.iconSize + (80 * animationMovement.value);
    final imageSize = Size(iconSize, iconSize);
    final xOffset = sizes.catcherAnimationXTravel * animationMovement.value;
    final yOffset = sizes.catcherAnimationYTravel * animationMovement.value;
    final left = sizes.catcherAnimationLeft + xOffset;
    final top = sizes.catcherAnimationTop + yOffset;
    final rect = Rect.fromLTWH(left, top, iconSize, iconSize);

    paintImage(
      opacity: opacity,
      canvas: canvas,
      rect: rect,
      image: icon,
    );
  }

  @override
  bool shouldRepaint(covariant SlidingIconPainter oldDelegate) {
    return oldDelegate.animationMovement.value != animationMovement.value;
  }
}
