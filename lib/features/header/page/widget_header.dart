import 'package:bordered_text/bordered_text.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:vmb_portfolio/core/constants/custom_colors.dart';
import 'package:vmb_portfolio/features/header/page/sizes_header.dart';
import 'menu/widget_compact_menu.dart';
import 'menu/widget_large_menu.dart';

class HeaderWidget extends StatelessWidget {
  final HeaderSizes sizes;
  const HeaderWidget({required this.sizes, super.key});

  @override
  Widget build(BuildContext context) => ConstrainedBox(
    constraints: sizes.box,
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [ _leftPart, _rightPart, ],
    ),
  );

  BoxConstraints get box => sizes.box;
  Widget get _rightPart => sizes.isCompact
      ? CompactMenuWidget(box: sizes.rightPartBox)
      : LargeMenuWidget(sizes: sizes);

  Widget get _leftPart {
    return Container(
      constraints: sizes.leftPartBox,
      alignment: Alignment.center,
      child: BorderedText(
        strokeColor: Colors.blueGrey,
        strokeWidth: sizes.leftPartStrokeWidth,
        strokeJoin: StrokeJoin.round,
        child: Text(
          "VMB",
          style: _initialsStyle,
        ),
      ),
    );
  }

  TextStyle get _initialsStyle {
    return GoogleFonts.rajdhani(
      fontWeight: FontWeight.w900,
      color: MyColors.bigText,
      fontSize: sizes.leftPartFontSize,
      shadows: [
        Shadow(
          offset: const Offset(-0.5, -0.5),
          blurRadius: sizes.leftPartTopBlueRadius,
          color: MyColors.textTopShadow,
        ),
        Shadow(
          offset: const Offset(1.1, 1.1),
          blurRadius: sizes.leftPartBotBlueRadius,
          color: MyColors.textBotShadow,
        ),
      ],
    );
  }
}