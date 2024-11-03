import 'package:flutter/cupertino.dart';
import 'package:vmb_portfolio/core/extensions/box_constraints.dart';

import '../../../core/presentation/sizes/sizes.dart';

class HeaderSizes extends Sizes {
  final BoxConstraints box;
  late BoxConstraints _leftPartBox;
  late BoxConstraints _rightPartBox;
  // late double _rightPart;
  late EdgeInsetsDirectional _horizontalSmallMargin;
  late double _rightPartStrokeWidth;
  late double _rightPartFontSize;
  late double _rightPartShadowTopBlueRadius;
  late double _rightPartShadowBotBlueRadius;
  late double _leftPartStrokeWidth;
  late double _leftPartFontSize;
  late double _leftPartTopBlurRadius;
  late double _leftPartBotBlurRadius;

  HeaderSizes({required this.box, required super.screen, required super.isCompact}) {
    initLeftPart(box);
    initRightPart(box);
  }

  void initRightPart(BoxConstraints box) {
    _rightPartBox = isCompact
        ? BoxConstraints.tightFor(height: box.H, width: box.W * 0.1)
        : BoxConstraints.tightFor(height: box.H, width: box.W * 0.5);
    _rightPartFontSize = box.H * 0.35;
    _rightPartStrokeWidth = box.H * 0.025;
    _horizontalSmallMargin = EdgeInsetsDirectional.only(end: box.W * 0.015);
    _rightPartShadowTopBlueRadius = box.H * 0.01;
    _rightPartShadowBotBlueRadius = box.H * 0.02;
  }
  double get rightPartShadowTopBlueRadius => _rightPartShadowTopBlueRadius;
  double get rightPartShadowBotBlueRadius => _rightPartShadowBotBlueRadius;
  EdgeInsetsDirectional get horizontalSmallMargin => _horizontalSmallMargin;
  BoxConstraints get rightPartBox => _rightPartBox;
  double get rightPartFontSize => _rightPartFontSize;
  double get rightPartStrokeWidth => _rightPartStrokeWidth;

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
}