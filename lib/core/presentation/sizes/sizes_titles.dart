import 'package:flutter/material.dart';
import 'package:vmb_portfolio/core/extensions/box_constraints.dart';
import 'package:vmb_portfolio/core/presentation/sizes/sizes.dart';

class TitlesSizes extends Sizes {
  final BoxConstraints box;

  late EdgeInsetsDirectional _margin;
  late double _textFontSize;
  late double _textShadowTopBlurRadius;
  late double _textShadowBotBlurRadius;

  TitlesSizes({required this.box, required super.isCompact, required super.screen}){
    _margin = EdgeInsetsDirectional.only(top: screen.H * 0.08, bottom: screen.H * 0.05);
    _textFontSize = isCompact ? screen.W * 0.06 : screen.W * 0.03;
    _textShadowTopBlurRadius = (screen.H * 0.005).clamp(0.1, 2);
    _textShadowBotBlurRadius = (screen.H * 0.003).clamp(0.002, 3);
  }
  EdgeInsetsDirectional get margin => _margin;
  double get textFontSize => _textFontSize;
  double get textShadowTopBlurRadius => _textShadowTopBlurRadius;
  double get textShadowBotBlurRadius => _textShadowBotBlurRadius;
}