import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:vmb_portfolio/core/presentation/sizes/sizes_titles.dart';
import '../../constants/custom_colors.dart';

class TitleWidget extends StatelessWidget {
  final TitlesSizes sizes;
  final String title;
  final GlobalKey navBarKey;
  const TitleWidget(this.title, this.sizes, {required this.navBarKey, super.key});

  @override
  Widget build(BuildContext context) {
    return
    Container(
      key: navBarKey,
      margin: sizes.margin.add(sizes.leftPartMargin),
      child: Text(
        "Projects",
        style: GoogleFonts.signikaNegative(
          color: MyColors.visibleText,
          fontSize: sizes.fonts.big,
          // fontSize: sizes.textFontSize,
          shadows: [
            Shadow(
              offset: const Offset(-0.2, -0.2),
              blurRadius: sizes.textShadowTopBlurRadius,
              color: MyColors.textTopShadow,
            ),
            Shadow(
              offset: const Offset(0.05, 0.05),
              blurRadius: sizes.textShadowBotBlurRadius,
              color: MyColors.textBotShadow,
            ),
          ],
        ),
      ),
    );
  }
}
