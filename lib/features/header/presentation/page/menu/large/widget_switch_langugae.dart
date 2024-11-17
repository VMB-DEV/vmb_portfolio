import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:vmb_portfolio/core/state_management/riverpod/language/provider_language.dart';

import '../../../../../../core/constants/custom_colors.dart';
import '../../../../../../core/data/values/languages.dart';
import '../../../../../../core/presentation/text/painter_animated_underline.dart';
import '../../sizes_header.dart';

class LanguageSwitchWidget extends ConsumerStatefulWidget {
  final HeaderSizes sizes;
  const LanguageSwitchWidget({
    required this.sizes,
    super.key,
  });

  @override
  ConsumerState<LanguageSwitchWidget> createState() => _ButtonLargeHeaderWidget();
}

class _ButtonLargeHeaderWidget extends ConsumerState<LanguageSwitchWidget> with SingleTickerProviderStateMixin {
  bool onHover = false;
  bool enHover = false;
  bool frHover = false;
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
    ref.watch(languageProvider);
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        textListenToMouse(
          true,
          Languages.english
          // ref.watch(languageProvider).language,
        ),
        Container(
          margin: sizes.smallMargins.end,
          child: Text( "/", style: textStyle(true, true), ),
        ),
        Container(
          margin: sizes.mediumMargins.end,
          child: textListenToMouse(
            false,
            Languages.french,
            // ref.watch(languageProvider).language,
          ),
        )
      ],
    );
  }

  Widget textListenToMouse(bool selected, Languages language) => MouseRegion(
    hitTestBehavior: HitTestBehavior.translucent,
    onEnter: (_) => setHover(true, language),
    onExit: (_) => setHover(false, language),
    child: InkWell(
      onTap: () {},
      child: Container(
        margin: sizes.smallMargins.end,
        child: CustomPaint(
          painter: switch (language) {
            Languages.english => enHover ? animatedPainter("en") : null,
            Languages.french => frHover ? animatedPainter("fr") : null,
          },
          child: Text(
            switch(language) {
              Languages.english => "en",
              Languages.french => "fr",
            },
            style: textStyle(
              selected,
              switch(language) {
                Languages.english => enHover,
                Languages.french => frHover,
              },
            ),
          ),
        ),
      ),
    ),
  );

  TextStyle textStyle(bool selected, bool hover) => GoogleFonts.signikaNegative(
    color: onHover
        ? hover ? MyColors.visibleText : MyColors.unselectedText
        : selected ? MyColors.visibleText : MyColors.unselectedText
    ,
    fontSize: sizes.fonts.medium,
    shadows: hover ? [
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

  void setHover(bool state, Languages language) {
    setState(() => onHover = state);
    switch (language) {
      case Languages.english: setState(() => enHover = state);
      case Languages.french: setState(() => frHover = state);
    }
    if (state) {
      _controller.forward();
    } else {
      _controller.reverse();
    }
  }

  CustomPainter animatedPainter(String text) => AnimatedUnderlinePainter(
    text: text,
    animation: animationValue,
    fontSize: sizes.fonts.medium,
    repaint: _controller,
  );
}
