import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:vmb_portfolio/features/header/domain/PartEntity.dart';
import 'package:vmb_portfolio/features/header/page/menu/painter_animated_underline.dart';
import 'package:vmb_portfolio/features/header/page/sizes_header.dart';

import '../../../../core/constants/custom_colors.dart';

class LargeMenuWidget extends StatelessWidget {
  final HeaderSizes sizes;
  const LargeMenuWidget({required this.sizes, super.key});

  @override
  Widget build(BuildContext context) => Row(
    children: PartEntity.values.map((part)
    => HeaderButton(
      text: part.name,
      sizes: sizes,
    )).toList(),
  );
}

class HeaderButton extends StatefulWidget {
  final String text;
  final HeaderSizes sizes;
  const HeaderButton({required this.text, required this.sizes, super.key});

  @override
  State<HeaderButton> createState() => _HeaderButtonState();
}

class _HeaderButtonState extends State<HeaderButton> with SingleTickerProviderStateMixin {
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
      end: widget.sizes.rightPartShadowTopBlueRadius,
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