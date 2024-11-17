import 'package:flutter/material.dart';
import 'package:vmb_portfolio/core/extensions/offset.dart';
import 'package:vmb_portfolio/core/extensions/path.dart';

class TitleDelimiterPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final allRect = Rect.fromLTWH(0, 0, size.width, size.height);
    final paint = Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = size.width * 0.002
      ..strokeJoin = StrokeJoin.round
      ..shader = const LinearGradient(
        stops: [ 0.15, 0.95 ],
        begin: Alignment.centerLeft,
        end: Alignment.centerRight,
        colors: [
          Colors.white60,
          Colors.transparent,
        ],
      ).createShader(allRect);

    final Offset start = allRect.centerLeft.plusX( size.width * 0.02);
    final Offset end = allRect.centerRight.plusX( size.width * 0.2);
    final line = Path()..moveToOffset(start)..lineToOffset(end)..close();
    canvas.drawPath(line, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}