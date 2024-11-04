import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:vmb_portfolio/core/extensions/box_constraints.dart';

import '../../../core/presentation/sizes/sizes.dart';

class CatcherSizes extends Sizes {
  final BoxConstraints box;
  
  late BoxConstraints _buttonGoToProjectBox;
  late BoxConstraints _linksBox;
  late double _specialisationFontSize;
  late double _catchPhraseFontSize;
  late double _catchPhraseStrokeWidth;
  late double _catchPhraseTopShadowBlurRadius;
  late double _catchPhraseBotShadowBlurRadius;
  late EdgeInsetsDirectional _verticalMargin;
  late EdgeInsetsDirectional _horizontalSmallMargin;
  late EdgeInsetsDirectional _horizontalMediumMargin;

  CatcherSizes({required this.box, required super.screen}) {
    initText();
    initClickable();
    initMargins();
  }

  void initMargins() {
    _verticalMargin = EdgeInsetsDirectional.only(top: box.H * 0.03);
    _horizontalSmallMargin = EdgeInsetsDirectional.only(end: box.W * 0.015);
    _horizontalMediumMargin = EdgeInsetsDirectional.only(end: box.W * 0.035);
  }
  EdgeInsetsDirectional get verticalMargin => _verticalMargin;
  EdgeInsetsDirectional get horizontalSmallMargin => _horizontalSmallMargin;
  EdgeInsetsDirectional get horizontalMediumMargin => _horizontalMediumMargin;

  void initText() {
    _specialisationFontSize = box.isCompact ? box.W * 0.03 : box.W * 0.013;
    _catchPhraseFontSize = box.isCompact ? box.W * 0.06 : box.W * 0.03;
    _catchPhraseTopShadowBlurRadius = (box.H * 0.005).clamp(0.1, 2);
    _catchPhraseBotShadowBlurRadius = (box.H * 0.003).clamp(0.002, 3);
    _catchPhraseStrokeWidth = box.W * 0.001;
  }
  double get specialisationFontSize => _specialisationFontSize;
  double get catchPhraseFontSize => _catchPhraseFontSize;
  double get catchPhraseTopShadowBlurRadius => _catchPhraseTopShadowBlurRadius;
  double get catchPhraseBotShadowBlurRadius => _catchPhraseBotShadowBlurRadius;
  double get catchPhraseStrokeWidth => _catchPhraseStrokeWidth;

  void initClickable() {
    _buttonGoToProjectBox = BoxConstraints.tightFor(height: box.H * 0.08, width: box.H * 0.3);
    _linksBox = BoxConstraints.tightFor(height: box.H * 0.05, width: box.H * 0.2);
  }
  
  BoxConstraints get buttonGoToProjectBox => _buttonGoToProjectBox;
  BoxConstraints get linksBox => _linksBox;
}