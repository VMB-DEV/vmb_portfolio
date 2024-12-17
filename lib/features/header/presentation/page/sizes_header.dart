import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:vmb_portfolio/core/extensions/box_constraints.dart';
import 'package:vmb_portfolio/features/header/domain/entity/entity_part.dart';

import '../../../../core/data/values/languages.dart';
import '../../../../core/presentation/sizes/sizes.dart';

class HeaderSizes extends Sizes {
  final BoxConstraints box;
  late BoxConstraints _leftPartBox;
  late BoxConstraints _rightPartBox;
  late BoxConstraints _rightPartCompactTextBox;
  late EdgeInsetsDirectional _topSmallMargin;
  late EdgeInsetsDirectional _horizontalSmallMargin;
  late EdgeInsetsDirectional _horizontalMediumMargin;
  late EdgeInsetsDirectional _horizontalLargeMargin;
  late double _rightPartStrokeWidth;
  // late double _rightPartFontSize;
  late double _rightPartShadowTopBlueRadius;
  late double _rightPartShadowBotBlueRadius;
  late double _rightPartCompactMenuDelta;
  late List<Size> _stringSizes;
  late Size _biggestStringSize;
  late Size _rightPartCompactMenuSize;
  late double _leftPartStrokeWidth;
  late double _leftPartFontSize;
  late double _leftPartTopBlurRadius;
  late double _leftPartBotBlurRadius;
  late double _rightPartCompactMenuListTopDelta;

  HeaderSizes({required this.box, required super.screen}) {
    initLeftPart(box);
    initRightPart(box);
  }

  void initRightPart(BoxConstraints box) {
    _rightPartBox = isCompact
        ? BoxConstraints.tightFor(height: box.H, width: box.W * 0.1)
        : BoxConstraints.tightFor(height: box.H, width: box.W * 0.5);
    // _rightPartFontSize = box.H * 0.35;
    _rightPartStrokeWidth = box.H * 0.025;
    _horizontalSmallMargin = EdgeInsetsDirectional.only(end: box.W * 0.015);
    _horizontalMediumMargin = EdgeInsetsDirectional.only(end: box.W * 0.03);
    _horizontalLargeMargin = EdgeInsetsDirectional.only(end: box.W * 0.06);
    _topSmallMargin = EdgeInsetsDirectional.only(top: box.W * 0.015);
    _rightPartShadowTopBlueRadius = box.H * 0.01;
    _rightPartShadowBotBlueRadius = box.H * 0.02;
    _rightPartCompactMenuDelta = box.W * 0.02;
    _stringSizes = _getStringSizes;
    _biggestStringSize = _getBiggestStringSize;
    // _rightPartCompactTextBox = BoxConstraints.tightFor(height: _biggestStringSize.height * 1.4, width: _biggestStringSize.width * 1.2);
    _rightPartCompactTextBox = BoxConstraints.tightFor(height: _biggestStringSize.height * 1.4, width: _biggestStringSize.width * 1.2);
    _rightPartCompactMenuListTopDelta = _rightPartCompactTextBox.maxHeight * 0.7;
    _rightPartCompactMenuSize = Size(
      _rightPartCompactTextBox.maxWidth,
      _rightPartCompactTextBox.maxHeight * PartEntity.values.length
        + _rightPartCompactMenuListTopDelta
    );
  }

  double get rightPartShadowTopBlueRadius => _rightPartShadowTopBlueRadius;
  double get rightPartShadowBotBlueRadius => _rightPartShadowBotBlueRadius;
  EdgeInsetsDirectional get horizontalSmallMargin => _horizontalSmallMargin;
  EdgeInsetsDirectional get horizontalMediumMargin => _horizontalMediumMargin;
  EdgeInsetsDirectional get horizontalLargeMargin => _horizontalLargeMargin;
  EdgeInsetsDirectional get topSmallMargin => _topSmallMargin;
  BoxConstraints get rightPartBox => _rightPartBox;
  BoxConstraints get rightPartCompactTextBox => _rightPartCompactTextBox;
  // double get rightPartFontSize => _rightPartFontSize;
  double get rightPartStrokeWidth => _rightPartStrokeWidth;
  double get rightPartCompactMenuDelta => _rightPartCompactMenuDelta;
  List<Size> get stringSizes => _stringSizes;
  Size get biggestStringWidth => _biggestStringSize;
  Size get rightPartCompactMenuSize => _rightPartCompactMenuSize;
  double get rightPartCompactMenuListTopDelta => _rightPartCompactMenuListTopDelta;

  void initLeftPart(BoxConstraints box) {
    _leftPartBox = BoxConstraints.tightFor(
      height: box.H * 1,
      width: box.H * 3,
    );
    _leftPartStrokeWidth = box.H * 0.05;
    _leftPartFontSize = box.H * 0.8;
    _leftPartTopBlurRadius = (box.H * 0.005).clamp(0.2, 2);
    _leftPartBotBlurRadius = (box.H * 0.01).clamp(0.1, 3);
  }
  BoxConstraints get leftPartBox => _leftPartBox;
  double get leftPartStrokeWidth => _leftPartStrokeWidth;
  double get leftPartFontSize => _leftPartFontSize;
  double get leftPartTopBlueRadius => _leftPartTopBlurRadius;
  double get leftPartBotBlueRadius => _leftPartBotBlurRadius;

  Size get _getBiggestStringSize {
    final biggestWidth = _stringSizes
        .map((size) => size.width)
        .reduce(max);
    final height = _stringSizes.first.height;
    return Size(biggestWidth, height);
  }

  Size _getStringSize(String str) {
    var span = TextSpan(
      text: str,
      style: GoogleFonts.rajdhani(
        fontWeight: FontWeight.w600,
        fontSize: fonts.medium,
      ),
    );

    final textPainter = TextPainter( text: span, maxLines: 1, textDirection: TextDirection.ltr,);
    textPainter.layout();
    return textPainter.size;
  }

  List<Size> get _getStringSizes => PartEntity
      .names(Languages.english)
      .map((name) => _getStringSize(name))
      .toList();
}