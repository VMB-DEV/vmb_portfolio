import 'package:bordered_text/bordered_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:vmb_portfolio/core/extensions/box_constraints.dart';
import 'package:vmb_portfolio/core/utils/contruction.dart';

import '../../../core/constants/custom_colors.dart';
import '../../../core/utils/logs.dart';

class CatcherPart extends StatelessWidget {
  final BoxConstraints box;
  const CatcherPart({required this.box, super.key});

  @override
  Widget build(BuildContext context) {
    Log.red('CatcherPart.build - ${box}');
    return Container(
      color: MyColors.test1,
      margin: EdgeInsetsDirectional.only(start: box.W * 0.13, top: box.H * 0.15),
      height: box.H,
      width: box.W,
      child: Row(
        children: [
          Container(
            margin: _widthMarginMedium,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _threeLinePresentation,
                  _specialisation,
                  _goToWork,
                  _links
                ],
              )
          ),
          Container( height: box.H * 0.85, width: box.W * 0.4,color: MyColors.test2,),
          // ToConstruct(height: box.H, width: box.W * 0.4, str: "Animated presentation")
        ],
      ),
    );
  }

  Widget get _links => _box(
    child: Row(
      children: [
        _link("github"),
        _link("linkedin"),
        _link("stackoverflow"),
      ],
    ),
  );

  Widget get _goToWork => _box(
    child: ToConstruct(height: box.H * 0.08, width: box.H * 0.3, str: "go to projets"),
  );

  Widget _link(String str) => Container(
    margin: _heightMargin.add(_widthMarginSmall),
    child: ToConstruct(height: box.H * 0.05, width: box.H * 0.2, str: str),
  );

  Widget get _specialisation => _box(
    child: Text(
      "Mobile  /  Web  /  Crossplatform  /  Full Stack developper",
      textAlign: TextAlign.start,
      style: GoogleFonts.signikaNegative(
        color: MyColors.bigText,
        fontSize: box.isCompact
            ? box.W * 0.03
            // : box.H * 0.03,
            : box.W * 0.013,
      ),
    ),
  );

  Widget get _threeLinePresentation => BorderedText(
    strokeColor: MyColors.bigTextBorders,
    strokeWidth: box.W * 0.001,
    strokeJoin: StrokeJoin.bevel,
    child: Text(
      "Hello,\nI'm Valentin.\nApplication developper.",
      textAlign: TextAlign.start,
      style: _bigTextStyle
    ),
  );

  TextStyle get _bigTextStyle {
    return GoogleFonts.signikaNegative(
      color: MyColors.bigText,
      // fontSize: box.H * 0.1,
      fontSize: box.isCompact
          ? box.W * 0.06
          : box.W * 0.03,
      shadows: [
        Shadow(
          offset: const Offset(-0.2, -0.2),
          blurRadius: (box.H * 0.005).clamp(0.1, 2),
          color: MyColors.textTopShadow,
        ),
        Shadow(
          offset: const Offset(0.05, 0.05),
          blurRadius: (box.H * 0.003).clamp(0.002, 3),
          color: MyColors.textBotShadow,
        ),
      ],
    );
  }

  Widget _box({required child}) => Container(
    margin: _heightMargin,
    child: child,
  );
  EdgeInsetsDirectional get _heightMargin => EdgeInsetsDirectional.only(top: box.H * 0.03);
  EdgeInsetsDirectional get _widthMarginSmall => EdgeInsetsDirectional.only(end: box.W * 0.015);
  EdgeInsetsDirectional get _widthMarginMedium => EdgeInsetsDirectional.only(end: box.W * 0.035);
}
