import 'package:bordered_text/bordered_text.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:vmb_portfolio/core/constants/custom_colors.dart';
import 'package:vmb_portfolio/core/extensions/box_constraints.dart';

import 'menu/widget_compact_menu.dart';
import 'menu/widget_large_menu.dart';

class HeaderWidget extends StatelessWidget {
  final BoxConstraints box;
  const HeaderWidget({required this.box, super.key});

  @override
  Widget build(BuildContext context) => SizedBox(
    height: box.H,
    width: box.W,
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [ _leftPart, _rightPart, ],
    ),
  );

  Widget get _rightPart => box.W > 600 ? _largeRightPart : _compactRightPart;
  Widget get _largeRightPart => LargeMenuWidget(box: BoxConstraints.tightFor(height: box.H, width: box.W * 0.5),);
  Widget get _compactRightPart => CompactMenuWidget(box: BoxConstraints.tightFor(height: box.H, width: box.W * 0.1),);

  Widget get _leftPart {
    return Container(
      height: box.H * 1,
      width: box.H * 2,
      alignment: Alignment.center,
      child: BorderedText(
        strokeColor: MyColors.bigTextBorders,
        strokeWidth: box.H * 0.05,
        strokeJoin: StrokeJoin.round,
        child: Text(
          "VMB",
          style: _initialsStyle,
        ),
      ),
    );
  }

  TextStyle get _initialsStyle {
    // style: TextStyle(
    // style: GoogleFonts.aBeeZee(
    // style: GoogleFonts.sourceCodePro(
    return GoogleFonts.signikaNegative(
      color: MyColors.bigText,
      fontSize: box.H * 0.8,
      shadows: [
        Shadow(
          offset: const Offset(-0.5, -0.5),
          blurRadius: (box.H * 0.01).clamp(0.4, 2),
          color: MyColors.textTopShadow,
        ),
        Shadow(
          offset: const Offset(1.2, 1.2),
          blurRadius: (box.H * 0.02).clamp(0.2, 3),
          color: MyColors.textBotShadow,
        ),
      ],
    );
  }

}
