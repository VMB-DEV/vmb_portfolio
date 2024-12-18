import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../../../../core/constants/custom_colors.dart';
import '../../../../../../core/state_management/riverpod/scroll/provider_scroll.dart';
import '../../sizes_header.dart';
import '../../../../../../core/presentation/text/painter_animated_underline.dart';

class ButtonLargeHeaderWidget extends ConsumerStatefulWidget {
  final String text;
  final int index;
  final HeaderSizes sizes;
  final VoidCallback onTap;
  const ButtonLargeHeaderWidget({
    required this.text,
    required this.sizes,
    required this.index,
    required this.onTap,
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
  HeaderSizes get sizes => widget.sizes;

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
      child: InkWell(
        onTap: widget.onTap,
        child: Container(
          margin: sizes.horizontalSmallMargin,
          child: CustomPaint(
            painter: animatedPainter,
            child: Text(
              widget.text,
              style: textStyle,
            ),
          ),
        ),
      ),
    );
  }

  TextStyle get textStyle => GoogleFonts.signikaNegative(
    color: MyColors.visibleText,
    fontSize: sizes.fonts.medium,
    shadows: onHover ? [
      Shadow(
        offset: const Offset(-0.5, -0.5),
        blurRadius: sizes.rightPartShadowTopBlueRadius,
        color: MyColors.textTopShadow,
      ),
      Shadow(
        offset: const Offset(1.2, 1.2),
        blurRadius: sizes.rightPartShadowBotBlueRadius,
        color: MyColors.textBotShadow,
      ),
    ] : [],
  );

  void setHover(bool state) {
    setState(() => onHover = state);
    if (state) {
      _controller.forward();
    } else {
      _controller.reverse();
    }
  }

  CustomPainter get animatedPainter => AnimatedUnderlinePainter(
    text: widget.text,
    animation: animationValue,
    fontSize: sizes.fonts.medium,
    repaint: _controller,
  );
}
