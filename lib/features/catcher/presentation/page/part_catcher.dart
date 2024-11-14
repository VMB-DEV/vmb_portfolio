import 'package:bordered_text/bordered_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:vmb_portfolio/core/constants/custom_colors.dart';
import 'package:vmb_portfolio/core/extensions/box_constraints.dart';
import 'package:vmb_portfolio/features/catcher/presentation/page/sizes_catcher.dart';
import 'package:vmb_portfolio/core/presentation/text/animated_link_widget.dart';
import 'package:vmb_portfolio/features/catcher/presentation/page/widget/fun/animated_widget_right_part.dart';

import '../state_management/text_icon_link/provider_catcher_url.dart';

class CatcherPart extends ConsumerStatefulWidget {
  final CatcherSizes sizes;
  final GlobalKey navBarKey;
  const CatcherPart({required this.sizes, required this.navBarKey, super.key});

  @override
  ConsumerState<CatcherPart> createState() => _CatcherPartState();
}

class _CatcherPartState extends ConsumerState<CatcherPart> with SingleTickerProviderStateMixin {
  bool onHover = false;
  final duration = const Duration(milliseconds: 200);
  late AnimationController _controller;
  late Animation<double> animationValue;

  CatcherSizes get sizes => widget.sizes;

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
  Widget build(BuildContext context) {
    return Container(
      key: widget.navBarKey,
      margin: widget.sizes.topPartMargin.add(widget.sizes.leftPartMargin),
      // constraints: widget.sizes.box,
      child: widget.sizes.isCompact ? _compactLayout : _largeLayout,
    );
  }

  Widget get _compactLayout => Column(
    children: [
      Container(
        constraints: sizes.catcherAnimationCompactBox,
        child: AnimatedCatcherRightPartWidget(sizes: sizes,),
      ),
      Container(
        margin: widget.sizes.horizontalMediumMargin,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _threeLinePresentation,
            _specialisation,
            _techno,
            _links
          ],
        ),
      ),
    ],
  );

  Widget get _largeLayout => Stack(
    children: [
      Positioned.fill(
        left: widget.sizes.catcherAnimationLeftAt,
          child: AnimatedCatcherRightPartWidget(sizes: sizes,),
      ),
      Container(
        margin: sizes.horizontalMediumMargin,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _threeLinePresentation,
            _specialisation,
            _techno,
            _links,
          ],
        ),
      ),
    ],
  );

  Widget get _links => _box(
    child: Row(
      children: [
        Text(
          "Find me here : ",
          style: GoogleFonts.rajdhani(
            color: MyColors.visibleText,
            fontSize: sizes.fonts.medium,
          ),
        ),
        ref.watch(catcherIconTextLinkProvider).when(
          data: (state) => state.github.when(
            data: (entity) => AnimatedLinkWidget(
              sizes: sizes,
              entity: entity,
            ),
            // error: (Object error, StackTrace stackTrace) => const Icon(Icons.error, color: MyColors.error,),
            error: (Object error, StackTrace stackTrace) => Text(stackTrace.toString(), style: TextStyle(color: Colors.white),),
            loading: () => const CircularProgressIndicator(),
          ),
          error: (Object error, StackTrace stackTrace) => const Icon(Icons.error, color: MyColors.error,),
          loading: () => const CircularProgressIndicator(),
        ),
        ref.watch(catcherIconTextLinkProvider).when(
          data: (state) => state.linkedin.when(
            data: (entity) => AnimatedLinkWidget(
              sizes: sizes,
              entity: entity,
            ),
            error: (Object error, StackTrace stackTrace) => const Icon(Icons.error, color: MyColors.error,),
            loading: () => const CircularProgressIndicator(),
          ),
          error: (Object error, StackTrace stackTrace) => const Icon(Icons.error, color: MyColors.error,),
          loading: () => const CircularProgressIndicator(),
        ),
      ],
    ),
  );

  Widget get _techno => _box(
    child: Text(
      "Dart  -  Kotlin  -  JavaScript  -  Python  -  C",
      textAlign: TextAlign.start,
      style: GoogleFonts.rajdhani(
        fontWeight: FontWeight.w600,
        color: MyColors.visibleText,
        // fontSize: sizes.specialisationFontSize,
        fontSize: sizes.fonts.medium,
      ),
    ),
  );

  Widget get _specialisation => _box(
    child: Text(
      "Mobile  /  Web  /  Crossplatform  /  Full Stack developper",
      textAlign: TextAlign.start,
      style: GoogleFonts.rajdhani(
        fontWeight: FontWeight.w600,
        color: MyColors.visibleText,
        fontSize: sizes.fonts.medium,
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
    return GoogleFonts.rajdhani(
      fontWeight: FontWeight.w700,
      color: MyColors.visibleText,
      // fontSize: sizes.catchPhraseFontSize,
      fontSize: sizes.isCompact ? sizes.fonts.big : sizes.fonts.extra,
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
    margin: sizes.mediumMargins.vertical,
    child: child,
  );
}