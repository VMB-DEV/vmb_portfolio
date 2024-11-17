import 'package:flutter/material.dart';
import 'package:vmb_portfolio/core/extensions/box_constraints.dart';

import '../../../../core/presentation/sizes/sizes.dart';

class ProjectsSizes extends Sizes {
  final BoxConstraints box;
  late BoxConstraints _projectBox;
  BoxConstraints get projectBox => _projectBox;
  late BoxConstraints _iconBox;
  BoxConstraints get iconBox => _iconBox;
  late double _iconBoxRadius;
  double get iconBoxRadius => _iconBoxRadius;
  late double _descriptionWidth;
  double get descriptionWidth => _descriptionWidth;
  late double _imageWidth;
  double get imageWidth => _imageWidth;
  late double _imageHeight;
  double get imageHeight => _imageHeight;

  ProjectsSizes({required this.box, required super.screen}){
    _projectBox = BoxConstraints.tightFor(width: screen.W, height: 300);
    _iconBox = BoxConstraints.tightFor(
      height: screen.H * 0.08,
      width: screen.H * 0.08,
    );
    _iconBoxRadius = screen.H * 0.025;
    _descriptionWidth = isCompact ? screen.W * 0.7 : screen.W * 0.4;
    _imageWidth = isCompact ? screen.W * 0.2 : screen.W * 0.13;
    _imageHeight = isCompact ? screen.W * 0.38 : screen.W * 0.19;
    // width: sizes.screen.W * 0.13,
    // height: sizes.screen.W * 0.19,
  }
}