import 'package:bordered_text/bordered_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:vmb_portfolio/core/extensions/box_constraints.dart';
import 'package:vmb_portfolio/core/utils/contruction.dart';
import 'package:vmb_portfolio/features/catcher/page/sizes_catcher.dart';
import '../../../core/constants/custom_colors.dart';

class CatcherPart extends StatelessWidget {
  final CatcherSizes sizes;
  final GlobalKey navBarKey;
  const CatcherPart({required this.sizes, required this.navBarKey, super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      key: navBarKey,
      color: MyColors.test1,
      margin: sizes.topPartMargin.add(sizes.leftPartMargin),
      constraints: sizes.box,
      child: sizes.isCompact ? _compactLayout : _largeLayout,
    );
  }

  Widget get _compactLayout => Column(
    children: [
      Container(
        height: sizes.box.H * 0.55,
        width: sizes.box.W * 0.4,
        color: MyColors.test2,
      ),
      Container(
        margin: sizes.horizontalMediumMargin,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _threeLinePresentation,
            _specialisation,
            _goToWork,
            _links
          ],
        ),
      ),
    ],
  );

  Widget get _largeLayout => Row(
    children: [
      Container(
          margin: sizes.horizontalMediumMargin,
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
      Container(
        height: sizes.box.H * 0.85,
        width: sizes.box.W * 0.4,
        color: MyColors.test2,
      ),
    ],
  );

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
    child: ToConstruct(box: sizes.buttonGoToProjectBox, str: "go to projets"),
  );

  Widget _link(String str) => Container(
    margin: sizes.verticalMargin.add(sizes.horizontalSmallMargin),
    child: ToConstruct(box: sizes.buttonGoToProjectBox, str: str),
  );

  Widget get _specialisation => _box(
    child: Text(
      "Mobile  /  Web  /  Crossplatform  /  Full Stack developper",
      textAlign: TextAlign.start,
      // style: GoogleFonts.signikaNegative(
      style: GoogleFonts.rajdhani(
        fontWeight: FontWeight.w600,
        color: MyColors.bigText,
        fontSize: sizes.specialisationFontSize,
      ),
    ),
  );

  Widget get _threeLinePresentation => BorderedText(
    strokeColor: MyColors.bigTextBorders,
    strokeWidth: sizes.catchPhraseStrokeWidth,
    strokeJoin: StrokeJoin.bevel,
    child: Text(
      "Hello,\nI'm Valentin.\nApplication developper.",
      textAlign: TextAlign.start,
      style: _catchPhraseStyle
    ),
  );

  TextStyle get _catchPhraseStyle {
    // return GoogleFonts.signikaNegative(
    return GoogleFonts.rajdhani(
      fontWeight: FontWeight.w700,
      color: MyColors.bigText,
      fontSize: sizes.catchPhraseFontSize,
      shadows: [
        Shadow(
          offset: const Offset(-0.2, -0.2),
          blurRadius: sizes.catchPhraseTopShadowBlurRadius,
          color: MyColors.textTopShadow,
        ),
        Shadow(
          offset: const Offset(0.05, 0.05),
          blurRadius: sizes.catchPhraseBotShadowBlurRadius,
          color: MyColors.textBotShadow,
        ),
      ],
    );
  }

  Widget _box({required child}) => Container(
    margin: sizes.verticalMargin,
    child: child,
  );
}
