import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:vmb_portfolio/core/presentation/text/painter_animated_text.dart';

import '../../constants/custom_colors.dart';

class AnimatedTextWidget extends StatefulWidget {
  final String text;
  final Size textSize;
  final double fontSize;
  final FontWeight fontWeight;
  final Animation<double> animation;
  final Listenable listenable;
  const AnimatedTextWidget({
    required this.text,
    required this.textSize,
    required this.fontSize,
    required this.fontWeight,
    required this.animation,
    required this.listenable,
    super.key,
  });

  @override
  State<AnimatedTextWidget> createState() => _AnimatedTextWidgetState();
}

class _AnimatedTextWidgetState extends State<AnimatedTextWidget> {
  late Animation<double> _whiteAnimationDisplay;
  late Animation<double> _whiteAnimationRemove;
  late Animation<double> _textAnimationDisplay;

  @override
  void initState() {
    _whiteAnimationDisplay = Tween<double>( begin: 0.0, end: 1.0, ).animate(
      CurvedAnimation(
        parent: widget.animation,
        curve: const Interval( 0.0, 0.5, curve: Curves.easeInOut, ),
        reverseCurve: const Interval(0.0, 0.0),
      ),
    );
    _whiteAnimationRemove = Tween<double>( begin: 0.0, end: 1.0, ).animate(
      CurvedAnimation(
        parent: widget.animation,
        // curve: const Interval( 0.5, 0.8, curve: Curves.easeInOut, ),
        curve: const Interval( 0.5, 1.0,  curve: Curves.easeInOut, ),
        reverseCurve: const Interval(0.0, 0.0),
      ),
    );
    _textAnimationDisplay = Tween<double>( begin: 0.0, end: 1.0, ).animate(
      CurvedAnimation(
        parent: widget.animation,
        curve: const Interval( 0.8, 1.0, curve: Curves.easeInOut, ),
      ),
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) => AnimatedBuilder(
    animation: widget.listenable,
    child: CustomPaint(
      child: Text(
        widget.text,
        style: GoogleFonts.rajdhani(
          fontWeight: widget.fontWeight,
          color: MyColors.visibleText,
          fontSize: widget.fontSize,
        ),
      ),
    ),
    builder: (ctx, child) {
      return CustomPaint(
        painter: AnimatedTextPainter(
          animationPercent: widget.animation,
          whiteAnimationDisplay: _whiteAnimationDisplay,
          whiteAnimationRemove: _whiteAnimationRemove,
          textSize: widget.textSize,
          repaint: widget.listenable,
        ),
        child: Opacity(
          opacity: _textAnimationDisplay.value,
          child: child,
        ),
      );
    },
  );
}
