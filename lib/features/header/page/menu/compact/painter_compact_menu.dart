import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:vmb_portfolio/core/extensions/offset.dart';
import 'package:vmb_portfolio/core/extensions/path.dart';
import 'package:vmb_portfolio/features/header/page/sizes_header.dart';

import '../../../../../core/utils/logs.dart';

class CompactMenuPainter extends CustomPainter {
  final HeaderSizes sizes;
  final List<String> texts;
  final Animation<double> animationPercent;
  final Animation<double> heightAnimation;
  final Animation<double> widthAnimation;

  CompactMenuPainter({
    required this.sizes,
    required this.texts,
    required this.animationPercent,
    required this.heightAnimation,
    required this.widthAnimation,
    required Listenable repaint,
  }) : super(repaint: repaint);
  
  @override
  void paint(Canvas canvas, Size size) {
    final double delta = sizes.rightPartCompactMenuDelta;
    final maxMenuSize = sizes.rightPartCompactMenuSize;
    final paint = Paint()
      ..style = PaintingStyle.fill
      ..color = Colors.red
    ;
    final paint2 = Paint()
      ..style = PaintingStyle.fill
      ..color = Colors.green
    ;
    const double squareWidth = 50;
    const double squareHeight = 50;
    final Offset squareTopLeft = Offset(size.width - squareWidth, 0);
    final Offset squareTopRight = Offset(size.width, 0);
    final Offset squareBotLeft = squareTopLeft.plusY(squareHeight);
    final Offset squareBotRight = squareTopRight.plusY(squareHeight);
    final square = Rect.fromPoints(squareTopLeft, squareBotRight);
    final squarePath = Path()
      ..moveToOffset(squareTopRight.plusX(delta))
      ..roundCorner(squareTopRight, delta, true, top: true, right: true)
      ..roundCorner(squareBotRight, delta, true, bot: true, right: true)
      ..roundCorner(squareBotLeft, delta, true, bot: true, left: true)
      ..roundCorner(squareTopLeft, delta, true, top: true, left: true)
    ;


    final double menuHeight = heightAnimation.value > 0.0
        ? heightAnimation.value * maxMenuSize.height
        : 0;
    final double menuWidth = widthAnimation.value > 0.0
        ? widthAnimation.value * maxMenuSize.width
        : 0;

    final Offset menuTopLeft = squareBotLeft.minusX(menuWidth);
    final Offset menuBotLeft = menuTopLeft.plusY(menuHeight);
    final Offset menuBotRight = squareBotRight.plusY(menuHeight);
    final menuPath = Path()
      ..moveToOffset(squareBotRight)
      ..roundCorner(menuBotRight, delta, true, bot: true, right: true)
      ..roundCorner(menuBotLeft, delta, true, bot: true, left: true)
    ;
    if (menuWidth > delta) {
      menuPath.roundCorner(menuTopLeft, delta, true, top: true, left: true);
      menuPath.roundCorner(squareBotLeft, delta, false, bot: true, right: true);
    } else {
      menuPath.lineToOffset(squareBotLeft.minusY(delta));
    }
    menuPath.lineToOffset(squareBotRight.minusY(delta));

    canvas.drawPath(squarePath, paint2);
    if (animationPercent.value > 0.0) canvas.drawPath(menuPath, paint2);
  }

  @override
  bool shouldRepaint(covariant CompactMenuPainter oldDelegate) {
    return oldDelegate.animationPercent.value != animationPercent.value;
  }
}