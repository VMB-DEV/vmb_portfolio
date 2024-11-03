import 'package:flutter/material.dart';
import 'package:vmb_portfolio/core/extensions/box_constraints.dart';

import '../../../../core/presentation/sizes/sizes.dart';

class ProjectsSizes extends Sizes {
  final BoxConstraints box;
  late BoxConstraints _projectBox;
  ProjectsSizes({required this.box, required super.isCompact, required super.screen}){
    _projectBox = BoxConstraints.tightFor(width: screen.W, height: 300);
  }
  BoxConstraints get projectBox => _projectBox;
}