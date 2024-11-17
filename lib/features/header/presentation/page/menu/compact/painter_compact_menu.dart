import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:vmb_portfolio/core/extensions/box_constraints.dart';
import 'package:vmb_portfolio/core/extensions/offset.dart';
import 'package:vmb_portfolio/core/extensions/path.dart';
import 'package:vmb_portfolio/features/header/presentation/page/sizes_header.dart';

import '../../../../../../core/utils/logs.dart';

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
    final double menuHeight = heightAnimation.value > 0.0 ? heightAnimation.value * maxMenuSize.height : 0;
    final double menuWidth = widthAnimation.value > 0.0 ? widthAnimation.value * maxMenuSize.width : 0;
    final allRect = Rect.fromLTWH(0, 0, maxMenuSize.width, maxMenuSize.height);
    final outlinePaint = Paint()
      ..style = PaintingStyle.stroke
      ..maskFilter = const MaskFilter.blur(BlurStyle.solid, 1.5)
      ..strokeWidth = 1.5
      ..shader = const LinearGradient(
        stops: [ 0.1, 0.95 ],
        begin: Alignment.topRight,
        end: Alignment.bottomCenter,
        colors: [
          Colors.white70,
          Colors.white,
        ],
      ).createShader(allRect);
    final fillPaint = Paint()
      ..imageFilter = ImageFilter.blur(sigmaX: 4, sigmaY: 4, tileMode: TileMode.decal)
      ..style = PaintingStyle.fill
      ..color = Colors.green
      ..shader = LinearGradient(
        stops: const [ 0.15, 0.95 ],
        begin: Alignment.topRight,
        end: Alignment.bottomLeft,
        colors: [
          Colors.blueGrey.shade800.withOpacity(0.9),
          Colors.blueGrey.shade600.withOpacity(0.9),
        ],
      ).createShader(allRect)
    ;
    final blurPaint = Paint()
      ..imageFilter = ImageFilter.blur(sigmaX: 1, sigmaY: 1, tileMode: TileMode.decal);

    final double squareWidth = sizes.rightPartBox.W;
    final double squareHeight = sizes.rightPartBox.H;
    final Offset squareTopLeft = Offset(size.width - squareWidth, 0);
    final Offset squareTopRight = Offset(size.width, 0);
    final Offset squareBotLeft = squareTopLeft.plusY(squareHeight);
    final Offset squareBotRight = squareTopRight.plusY(squareHeight);
    final Offset menuTopLeft = squareBotLeft.minusX(menuWidth);
    final Offset menuTopRight = squareBotRight.minusX(delta * 2);
    final Offset menuBotLeft = menuTopLeft.plusY(menuHeight);
    final Offset menuBotRight = menuTopRight.plusY(menuHeight);

    final backgroundPath = Path();
    //icon top left
    backgroundPath.moveToOffset(squareTopLeft.plusY(delta));
    backgroundPath.roundCorner(squareTopLeft, delta, true, top: true, left: true);
    //icon top right
    backgroundPath.roundCorner(squareTopRight, delta, true, top: true, right: true);
    //icon bot right
    backgroundPath.roundCorner(squareBotRight, delta, true, bot: true, right: true);
    if (animationPercent.value > 0.0) {
      // //menu top right
      if (menuHeight > delta ) {
        backgroundPath.roundCorner(menuTopRight, delta, false, top: true, left: true);
      }
      if (menuHeight > delta ) {
        //menu bot right
        backgroundPath.roundCorner(menuBotRight, delta, true, bot: true, right: true);
      }
      // menu bot left
      backgroundPath.roundCorner(menuBotLeft, delta, true, bot: true, left: true);
      //menu top left
      if (menuWidth > delta) {
        backgroundPath.roundCorner(menuTopLeft, delta, true, top: true, left: true);
      }
      //icon bot left
      if (menuWidth > delta) {
        backgroundPath.roundCorner(squareBotLeft, delta, false, bot: true, right: true);
      } else {
        backgroundPath.lineToOffset(squareBotLeft);
      }
    } else {
      //icon bot left
      backgroundPath.roundCorner(squareBotLeft, delta, true, bot: true, left: true);
    }
    backgroundPath.close();

    // canvas.drawPath(backgroundPath, blurPaint);
    canvas.drawPath(backgroundPath, fillPaint);
    canvas.drawPath(backgroundPath, outlinePaint);
  }

  @override
  bool shouldRepaint(covariant CompactMenuPainter oldDelegate) {
    return oldDelegate.animationPercent.value != animationPercent.value;
  }
}