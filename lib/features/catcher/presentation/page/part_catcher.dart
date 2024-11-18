import 'package:bordered_text/bordered_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:vmb_portfolio/core/constants/custom_colors.dart';
import 'package:vmb_portfolio/core/state_management/riverpod/language/provider_language.dart';
import 'package:vmb_portfolio/features/catcher/data/values/data_catcher.dart';
import 'package:vmb_portfolio/features/catcher/domain/entity/entity_icon_text_link.dart';
import 'package:vmb_portfolio/features/catcher/presentation/page/sizes_catcher.dart';
import 'package:vmb_portfolio/core/presentation/text/animated_link_widget.dart';
import 'package:vmb_portfolio/features/catcher/presentation/page/widget/fun/animated_widget_right_part.dart';
import '../../../../core/data/values/languages.dart';
import '../../../../core/presentation/text/widget_animated_text.dart';
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
  final duration = const Duration(milliseconds: 500);
  late AnimationController _controller;
  late Animation<double> _animationValue;
  final stringsData = CatcherData();
  Languages get language => ref.watch(languageProvider).requireValue.language.requireValue;
  IconTextLinkEntity get githubLink => ref.watch(catcherIconTextLinkProvider).requireValue.github.requireValue;
  IconTextLinkEntity get linkedinLink => ref.watch(catcherIconTextLinkProvider).requireValue.linkedin.requireValue;
  late Languages _currentLanguage;


  CatcherSizes get sizes => widget.sizes;


  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: duration,
      value: 0,
      vsync: this,
    );

    _animationValue = Tween<double>(
      begin: 0,
      end: 1,
    ).animate(_controller);
  }

  Languages? _previousLanguage;

  @override
  Widget build(BuildContext context) {
    if (_previousLanguage != null && _previousLanguage != language) {
      _controller.reverse().whenComplete(() {
        _controller.forward();
        setState(() => _currentLanguage = language);
      });
    } else if (_previousLanguage == null) {
      _currentLanguage = language;
      _controller.forward(from: 0);
    }
    _previousLanguage = language;

    return Container(
      key: widget.navBarKey,
      margin: widget.sizes.topPartMargin.add(widget.sizes.leftPartMargin),
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
            // _threeLinePresentation,
            _fourLinePresentation,
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
            // _threeLinePresentation,
            _fourLinePresentation,
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
        AnimatedTextWidget(
          text: stringsData.linkPrefix[_currentLanguage]!,
          fontSize: sizes.fonts.medium,
          fontWeight: FontWeight.w500,
          animation: _animationValue,
          listenable: _controller,
        ),
        AnimatedLinkWidget(
          sizes: sizes,
          entity: githubLink,
        ),
        AnimatedLinkWidget(
          sizes: sizes,
          entity: linkedinLink,
        ),
      ],
    ),
  );

  Widget get _techno => _box(
    child: AnimatedTextWidget(
      text: stringsData.mainTechno[_currentLanguage]!,
      animation: _animationValue,
      listenable: _controller,
      fontWeight: FontWeight.w600,
      fontSize: sizes.fonts.medium,
    ),
  );

  Widget get _specialisation => _box(
    child: AnimatedTextWidget(
      text: stringsData.specialisation,
      animation: _animationValue,
      listenable: _controller,
      fontWeight: FontWeight.w600,
      fontSize: sizes.fonts.medium,
    ),
  );

  Widget get _fourLinePresentation => Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: stringsData.threeLinesPresentation[_currentLanguage]!.split('\n').map((string)
    => AnimatedTextWidget(
      text: string,
      fontSize: sizes.isCompact ? sizes.fonts.big : sizes.fonts.extra,
      fontWeight: FontWeight.w700,
      animation: _animationValue,
      listenable: _controller,
      textWidget: BorderedText(
        strokeColor: MyColors.bigTextBorders,
        strokeWidth: sizes.catchPhraseStrokeWidth,
        strokeJoin: StrokeJoin.bevel,
        child: Text(
            string,
            textAlign: TextAlign.start,
            style: _catchPhraseStyle
        ),
      ),
    ),
    ).toList(),);

  TextStyle get _catchPhraseStyle {
    return GoogleFonts.rajdhani(
      fontWeight: FontWeight.w700,
      color: MyColors.visibleText,
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