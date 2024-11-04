import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:vmb_portfolio/core/extensions/box_constraints.dart';
import 'package:vmb_portfolio/core/presentation/sizes/sizes_titles.dart';
import 'package:vmb_portfolio/features/header/page/sizes_header.dart';

import '../../../features/catcher/page/sizes_catcher.dart';
import '../../../features/projects/presentation/page/sizes_projects.dart';

class Sizes {
  final BoxConstraints screen;
  late bool _isCompact;
  bool get isCompact => _isCompact;
  late EdgeInsetsDirectional _topPartMargin;
  EdgeInsetsDirectional get topPartMargin => _topPartMargin;
  late EdgeInsetsDirectional _leftPartMargin;
  EdgeInsetsDirectional get leftPartMargin => _leftPartMargin;

  Sizes({required this.screen}) {
    _isCompact = screen.W < 700;
    final topMarginRatio = isCompact ? 0.08 : 0.15;
    _topPartMargin = EdgeInsetsDirectional.only(top: screen.H * topMarginRatio);
    _leftPartMargin = EdgeInsetsDirectional.only(start: screen.W * 0.13);
  }
}

class AllSizes extends Sizes {
  late BoxConstraints _catcherBox;
  late CatcherSizes catcher;
  late BoxConstraints _headerBox;
  late HeaderSizes header;
  late BoxConstraints scrollViewBox;
  late BoxConstraints _projectBox;
  late ProjectsSizes projects;
  late BoxConstraints _titlesBox;
  late TitlesSizes titles;
  AllSizes({required super.screen, bool? isCompact}) {
    initCatcher();
    initHeader();
    initTitles();
    initProjects();
  }

  void initHeader() {
    const headerRatio = 0.07;
    _headerBox = BoxConstraints.tightFor( height: screen.H * headerRatio, width: screen.W, );
    scrollViewBox = BoxConstraints.tightFor( height: screen.H * (1 - headerRatio), width: screen.W, );
    header = HeaderSizes(box: _headerBox, screen: screen);
  }
  void initCatcher() {
    _catcherBox = BoxConstraints.tightFor( height: screen.H * 0.7, width: screen.W, );
    catcher = CatcherSizes(screen: screen, box: _catcherBox);
  }
  void initTitles() {
    _titlesBox = BoxConstraints.tightFor( height: screen.H * 0.1, width: screen.W, );
    titles = TitlesSizes(box: _titlesBox, screen: screen);
  }
  void initProjects() {
    _projectBox = BoxConstraints.tightFor( height: screen.H * 0.1, width: screen.W, );
    projects = ProjectsSizes(box: _projectBox, screen: screen);
  }
}