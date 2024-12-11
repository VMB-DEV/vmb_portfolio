import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:vmb_portfolio/core/presentation/text/painter_animated_text.dart';

import '../../constants/custom_colors.dart';

class AnimatedTextWidget extends StatefulWidget {
  final String text;
  final Size? textSize;
  final double fontSize;
  final FontWeight fontWeight;
  final Animation<double> animation;
  final Listenable listenable;
  final bool reverseDirection;
  final Widget? textWidget;
  final double? textMaxWidth;
  const AnimatedTextWidget({
    required this.text,
    this.textSize,
    required this.fontSize,
    required this.fontWeight,
    required this.animation,
    required this.listenable,
    this.reverseDirection = false,
    this.textWidget,
    this.textMaxWidth,
    super.key,
  });

  @override
  State<AnimatedTextWidget> createState() => _AnimatedTextWidgetState();
}

class _AnimatedTextWidgetState extends State<AnimatedTextWidget> {
  late Animation<double> _whiteAnimationDisplay;
  late Animation<double> _whiteAnimationRemove;
  late Animation<double> _textAnimationDisplay;
  late Size _textSize;
  String? _previousString;

  @override
  void initState() {
    _whiteAnimationDisplay = Tween<double>( begin: 0.0, end: 1.0, ).animate(
      CurvedAnimation(
        parent: widget.animation,
        curve: const Interval( 0.0, 0.65, curve: Curves.easeInOut, ),
        reverseCurve: const Interval(0.0, 0.2, curve: Curves.easeInOut),
      ),
    );
    _whiteAnimationRemove = Tween<double>( begin: 0.0, end: 1.0, ).animate(
      CurvedAnimation(
        parent: widget.animation,
        curve: const Interval( 0.65, 1.0,  curve: Curves.easeInOut, ),
        reverseCurve: const Interval(0.0, 1.0, curve: Curves.easeInOut),
      ),
    );
    _textAnimationDisplay = Tween<double>( begin: 0.0, end: 1.0, ).animate(
      CurvedAnimation(
        parent: widget.animation,
        curve: const Interval( 0.7, 1.0, curve: Curves.slowMiddle, ),
        reverseCurve: const Interval(0.5, 0.7),
      ),
    );
    super.initState();
  }

  Size getTextSize(String text) {
    var span = TextSpan(
      text: widget.text,
      style: GoogleFonts.rajdhani(
        fontWeight: FontWeight.w600,
        fontSize: widget.fontSize,
      ),
    );
    final textPainter = TextPainter( text: span, maxLines: 1, textDirection: TextDirection.ltr,);
    textPainter.layout();
    return textPainter.size;
  }

  @override
  Widget build(BuildContext context) {
    _textSize = widget.textSize != null ? widget.textSize! : getTextSize(widget.text);

    return AnimatedBuilder(
      animation: widget.listenable,
      child: CustomPaint(
        child: widget.textWidget ?? RichText(
          text: TextSpan(
          text: widget.text,
          style: TextStyle(
            fontFamily: 'Rajdhani',
            fontWeight: widget.fontWeight,
            fontSize: widget.fontSize,
            color: MyColors.visibleText,
          ),
        ),),
      ),
      builder: (ctx, child) {
        final lineMetrics = getLinesMetrics();
        return RepaintBoundary(
          child: CustomPaint(
            painter: AnimatedTextPainter(
              text: widget.text,
              fontWeight: widget.fontWeight,
              fontSize: widget.fontSize,
              animationPercent: widget.animation,
              whiteAnimationDisplay: _whiteAnimationDisplay,
              whiteAnimationRemove: _whiteAnimationRemove,
              textSize: _textSize,
              repaint: widget.listenable,
              invertDirection: widget.reverseDirection,
              textMaxWidth: widget.textMaxWidth,
              lineMetricsList: lineMetrics,
            ),
            child: Opacity(
              opacity: _textAnimationDisplay.value,
              child: child,
            ),
          ),
        );
      },
    );
  }


  List<LineMetrics> getLinesMetrics() {
    final textSpan = TextSpan(
      text: widget.text,
      style: TextStyle(
        fontFamily: 'Rajdhani',
        fontWeight: widget.fontWeight,
        fontSize: widget.fontSize,
      ),
    );

    final textPainter = TextPainter(
      text: textSpan,
      textDirection: TextDirection.ltr,
    );

    textPainter.layout(maxWidth: widget.textMaxWidth ?? double.infinity);

    final lineMetrics = textPainter.computeLineMetrics();

    return lineMetrics;
  }
}
