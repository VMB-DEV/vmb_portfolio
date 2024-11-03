import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:vmb_portfolio/core/extensions/box_constraints.dart';
import 'package:vmb_portfolio/core/presentation/sizes/sizes_titles.dart';
import 'package:vmb_portfolio/features/header/page/sizes_header.dart';

import '../../../features/catcher/page/sizes_catcher.dart';
import '../../../features/projects/presentation/page/sizes_projects.dart';

abstract class Sizes {
  final BoxConstraints box;
  final bool isCompact;

  Sizes({required this.box, required this.isCompact});
}


class AllSizes extends Sizes {
  late BoxConstraints _catcherBox;
  late CatcherSizes catcher;
  late BoxConstraints _headerBox;
  late HeaderSizes header;
  late BoxConstraints _projectBox;
  late ProjectsSizes projects;
  late BoxConstraints _titlesBox;
  late TitlesSizes titles;
  AllSizes({required super.box, bool? isCompact})
  :super( isCompact: boxCompact(box)) {
    initCatcher(box);
    initHeader(box);
    initTitles(box);
    initProjects(box);
  }
  static bool boxCompact(BoxConstraints box) => box.W < 700;

  void initCatcher(BoxConstraints box) {
    _catcherBox = BoxConstraints.tightFor( height: box.H * 0.7, width: box.W, );
    catcher = CatcherSizes(box: _catcherBox, isCompact: isCompact);
  }
  void initHeader(BoxConstraints box) {
    _headerBox = BoxConstraints.tightFor( height: box.H * 0.07, width: box.W, );
    header = HeaderSizes(box: _headerBox, isCompact: isCompact);
  }
  void initTitles(BoxConstraints box) {
    _titlesBox = BoxConstraints.tightFor( height: box.H * 0.1, width: box.W, );
    titles = TitlesSizes(box: _titlesBox, isCompact: isCompact);
  }
  void initProjects(BoxConstraints box) {
    _projectBox = BoxConstraints.tightFor( height: box.H * 0.1, width: box.W, );
    projects = ProjectsSizes(box: _projectBox, isCompact: isCompact);
  }
}