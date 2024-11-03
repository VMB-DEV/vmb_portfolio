import 'package:flutter/cupertino.dart';
import 'package:vmb_portfolio/core/extensions/box_constraints.dart';

import '../../../core/presentation/sizes/sizes.dart';

class HeaderSizes extends Sizes {
  late BoxConstraints _leftPartBox;
  late BoxConstraints _rightPartBox;
  late double _leftPartStrokeWidth;
  late double _leftPartFontSize;
  late double _leftPartTopBlurRadius;
  late double _leftPartBotBlurRadius;

  HeaderSizes({required super.box, required super.isCompact}) {
    initLeftPart(box);
    initRightPart(box);
  }

  void initRightPart(BoxConstraints box) {
    _rightPartBox = isCompact
        ? BoxConstraints.tightFor(height: box.H, width: box.W * 0.1)
        : BoxConstraints.tightFor(height: box.H, width: box.W * 0.5);
  }
  BoxConstraints get rightPartBox => _rightPartBox;
  void initLeftPart(BoxConstraints box) {
    _leftPartBox = BoxConstraints.tightFor(
      height: box.H * 1,
      width: box.H * 3,
    );
    _leftPartStrokeWidth = box.H * 0.05;
    _leftPartFontSize = box.H * 0.8;
    _leftPartTopBlurRadius = (box.H * 0.01).clamp(0.4, 2);
    _leftPartBotBlurRadius = (box.H * 0.02).clamp(0.2, 3);
  }
  BoxConstraints get leftPartBox => _leftPartBox;
  double get leftPartStrokeWidth => _leftPartStrokeWidth;
  double get leftPartFontSize => _leftPartFontSize;
  double get leftPartTopBlueRadius => _leftPartTopBlurRadius;
  double get leftPartBotBlueRadius => _leftPartBotBlurRadius;
}