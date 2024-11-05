import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../../core/constants/custom_colors.dart';
import '../../../../../core/state_management/riverpod/provider_scroll.dart';
import '../../sizes_header.dart';
import '../painter_animated_underline.dart';

class ButtonLargeHeaderWidget extends ConsumerStatefulWidget {
  final String text;
  final int index;
  final HeaderSizes sizes;
  const ButtonLargeHeaderWidget({
    required this.text,
    required this.sizes,
    required this.index,
    super.key,
  });

  @override
  ConsumerState<ButtonLargeHeaderWidget> createState() => _ButtonLargeHeaderWidget();
}

class _ButtonLargeHeaderWidget extends ConsumerState<ButtonLargeHeaderWidget> with SingleTickerProviderStateMixin {
  bool onHover = false;
  final duration = const Duration(milliseconds: 200);
  late AnimationController _controller;
  late Animation<double> animationValue;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: duration,
      value: 0,
      vsync: this,
    );

    animationValue = Tween<double>(
      begin: 0,
      end: 1,
    ).animate(_controller);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      hitTestBehavior: HitTestBehavior.translucent,
      onEnter: (_) => setHover(true),
      onExit: (_) => setHover(false),
      child: GestureDetector(
        onTap: () {
          ref.read(scrollRiverpod).updateIndexTo(widget.index);
        },
        child: Container(
          margin: widget.sizes.horizontalSmallMargin,
          child: CustomPaint(
            painter: AnimatedUnderlinePainter(
              text: widget.text,
              animation: animationValue,
              fontSize: widget.sizes.rightPartFontSize,
              repaint: _controller,
            ),
            child: Text(
              widget.text,
              style: GoogleFonts.signikaNegative(
                color: MyColors.bigText,
                fontSize: widget.sizes.rightPartFontSize,
                shadows: onHover ? [
                  Shadow(
                    offset: const Offset(-0.5, -0.5),
                    blurRadius: widget.sizes.rightPartShadowTopBlueRadius,
                    color: MyColors.textTopShadow,
                  ),
                  Shadow(
                    offset: const Offset(1.2, 1.2),
                    blurRadius: widget.sizes.rightPartShadowBotBlueRadius,
                    color: MyColors.textBotShadow,
                  ),
                ] : [],
              ),
            ),
          ),
        ),
      ),
    );
  }

  void setHover(bool state) {
    setState(() => onHover = state);
    if (state) {
      _controller.forward();
    } else {
      _controller.reverse();
    }
  }
}
