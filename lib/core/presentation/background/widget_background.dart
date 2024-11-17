import 'package:flutter/material.dart';
import 'package:vmb_portfolio/core/presentation/background/painter_background.dart';

class AppBackground extends StatelessWidget {
  final Widget child;
  const AppBackground({required this.child, super.key});

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      painter: BackgroundPainter(),
      child: child,
    );
  }
}
