import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:vmb_portfolio/core/extensions/box_constraints.dart';
import 'package:vmb_portfolio/core/presentation/sizes/size_font.dart';
import 'package:vmb_portfolio/core/presentation/sizes/size_margin.dart';
import 'package:vmb_portfolio/core/presentation/sizes/sizes_titles.dart';
import 'package:vmb_portfolio/features/header/presentation/page/sizes_header.dart';

import '../../../features/catcher/presentation/page/sizes_catcher.dart';
import '../../../features/projects/presentation/page/sizes_projects.dart';

class Sizes {
  final BoxConstraints screen;
  late bool _isCompact;
  bool get isCompact => _isCompact;
  late EdgeInsetsDirectional _topPartMargin;
  EdgeInsetsDirectional get topPartMargin => _topPartMargin;
  late EdgeInsetsDirectional _leftPartMargin;
  EdgeInsetsDirectional get leftPartMargin => _leftPartMargin;
  late EdgeInsetsDirectional _rightPartMargin;
  EdgeInsetsDirectional get rightPartMargin => _rightPartMargin;

  late MarginSize _smallMargins;
  MarginSize get smallMargins => _smallMargins;
  late MarginSize _mediumMargins;
  MarginSize get mediumMargins => _mediumMargins;
  late MarginSize _bigMargins;
  MarginSize get bigMargins => _bigMargins;
  late FontSizes _fonts;
  FontSizes get fonts => _fonts;

  Sizes({required this.screen}) {
    _isCompact = screen.W < 1000;
    final topMarginRatio = isCompact ? 0.08 : 0.15;
    _topPartMargin = EdgeInsetsDirectional.only(top: screen.H * topMarginRatio);
    _leftPartMargin = EdgeInsetsDirectional.only(start: screen.W * 0.11);
    _rightPartMargin = EdgeInsetsDirectional.only(end: screen.W * 0.06);

    initSmallMargins();
    initMediumMargins();
    initBigMargins();
    initFonts();
  }

  void initFonts() {
    final double smallRatio = isCompact ? 0.02 : 0.018;
    final double mediumRatio = isCompact ? 0.03 : 0.025;
    final double bigRatio = isCompact ? 0.05 : 0.03;
    final double extraRatio = 0.06;
    _fonts = FontSizes(
      small: smallRatio * screen.H,
      medium: mediumRatio * screen.H,
      big: bigRatio * screen.H,
      extra: extraRatio * screen.H,
    );
  }

  void initBigMargins() {
    final double ratioH = isCompact ? 0.12 : 0.025;
    final double ratioV = isCompact ? 0.12 : 0.2;
    _bigMargins = initMargins(ratioH: ratioH, ratioV: ratioV);
  }

  void initMediumMargins() {
    final double ratioH = isCompact ? 0.015 : 0.01;
    final double ratioV = isCompact ? 0.06 : 0.1;
    _mediumMargins = initMargins(ratioH: ratioH, ratioV: ratioV);
  }
  
  void initSmallMargins() {
    // final double ratioH = isCompact ? 0.01 : 0.005;
    final double ratioH = isCompact ? 0.006 : 0.005;
    final double ratioV = isCompact ? 0.03 : 0.025;
    _smallMargins = initMargins(ratioH: ratioH, ratioV: ratioV);
  }

  MarginSize initMargins({ required double ratioH, required double ratioV,}) => MarginSize(
    horizontalValue: screen.W * ratioH,
    verticalValue: screen.H * ratioV,
  );
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