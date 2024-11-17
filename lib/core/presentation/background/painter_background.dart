import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:vmb_portfolio/core/constants/custom_colors.dart';

class BackgroundPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final topLeft = Offset(0, 0);
    final botRight = Offset(size.width, size.height);
    final allRect = Rect.fromLTWH(0, 0, size.width, size.height);
    final backPaint = Paint()
      ..shader = const LinearGradient(
        stops: [ 0.15, 0.85 ],
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
        colors: [
          MyColors.backGroundFirst,
          MyColors.backGroundSecond,
        ],
      ).createShader(allRect)
      ;

    canvas.drawPaint(backPaint);
    // canvas.drawRect(allRect, backPaint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
  
}