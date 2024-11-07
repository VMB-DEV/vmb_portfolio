import 'package:bordered_text/bordered_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:vmb_portfolio/core/constants/custom_colors.dart';
import 'package:vmb_portfolio/core/extensions/box_constraints.dart';
import 'package:vmb_portfolio/features/catcher/presentation/page/sizes_catcher.dart';
import 'package:vmb_portfolio/features/catcher/presentation/page/widget_catcher_link.dart';
import 'package:vmb_portfolio/features/catcher/presentation/state_management/url/provider_catcher_url.dart';

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
        height: widget.sizes.box.H * 0.55,
        width: widget.sizes.box.W * 0.4,
        color: MyColors.test2,
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

  Widget get _largeLayout => Row(
    children: [
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
        Text(
          "Find me here : ",
          style: GoogleFonts.rajdhani(
            // fontWeight: FontWeight.w600,
            color: MyColors.visibleText,
            // fontSize: sizes.specialisationFontSize,
            fontSize: sizes.fonts.medium,
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
          ),
        ),
        ref.watch(catcherIconTextLinkProvider).when(
          data: (state) => state.github.when(
            data: (entity) => CatcherLinkAnimatedWidget(
              sizes: sizes,
              entity: entity,
            ),
            error: (Object error, StackTrace stackTrace) => const Icon(Icons.error, color: MyColors.error,),
            loading: () => const CircularProgressIndicator(),
          ),
          error: (Object error, StackTrace stackTrace) => const Icon(Icons.error, color: MyColors.error,),
          loading: () => const CircularProgressIndicator(),
        ),
        ref.watch(catcherIconTextLinkProvider).when(
          data: (state) => state.linkedin.when(
            data: (entity) => CatcherLinkAnimatedWidget(
              sizes: sizes,
              entity: entity,
            ),
            error: (Object error, StackTrace stackTrace) => const Icon(Icons.error, color: MyColors.error,),
            loading: () => const CircularProgressIndicator(),
          ),
          error: (Object error, StackTrace stackTrace) => const Icon(Icons.error, color: MyColors.error,),
          loading: () => const CircularProgressIndicator(),
        ),
        // CatcherLinkAnimatedWidget(
        //   PictureType.github,
        //   text: "github",
        //   urlString: "https://github.com/VMB-DEV",
        //   sizes: sizes,
        // ),
        // CatcherLinkAnimatedWidget(
        //   type: PictureType.linkedin,
        //   text: "linkedin",
        //   urlString: "https://www.linkedin.com/in/valentin-m-386653186/",
        //   sizes: sizes,
        // ),
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