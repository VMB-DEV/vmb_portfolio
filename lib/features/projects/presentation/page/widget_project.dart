import 'dart:ui' as ui;
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:vmb_portfolio/core/constants/custom_colors.dart';
import 'package:vmb_portfolio/core/data/values/languages.dart';
import 'package:vmb_portfolio/core/extensions/box_constraints.dart';
import 'package:vmb_portfolio/core/presentation/text/animated_link_widget.dart';
import 'package:vmb_portfolio/core/state_management/riverpod/language/provider_language.dart';
import 'package:vmb_portfolio/features/projects/domain/entity/entity_project.dart';
import 'package:vmb_portfolio/features/projects/presentation/page/painter_title_delimiter.dart';
import 'package:vmb_portfolio/features/projects/presentation/page/sizes_projects.dart';
import 'package:vmb_portfolio/features/projects/presentation/page/widget_image_popup.dart';

import '../../../../main.dart';

class ProjectWidget extends ConsumerStatefulWidget {
  final ProjectEntity entity;
  final ProjectsSizes sizes;
  const ProjectWidget({
    required this.entity,
    required this.sizes,
    super.key,
  });

  @override
  ConsumerState<ProjectWidget> createState() => _ProjectWidgetState();
}

class _ProjectWidgetState extends ConsumerState<ProjectWidget> {
  ProjectsSizes get _sizes => widget.sizes;
  ProjectEntity get _entity => widget.entity;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: _sizes.leftPartMargin.add(_sizes.mediumMargins.bot),
      child: Column(
        children: [
          _title,
          _sizes.isCompact ? _compactLayout : _largeLayout,
        ],
      ),
    );
  }

  Widget get _largeLayout => Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      _smallTextDescription,
      _smallPicturesLayout
    ],
  );

  Widget get _compactLayout => Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      _smallTextDescription,
      _smallPicturesLayout,
      // _smallAssetDescription,
    ],
  );

  Widget get _smallPicturesLayout => Container(
    margin: _sizes.smallMargins.top
        .add(_sizes.smallMargins.top)
        .add(_sizes.rightPartMargin)
    ,
    child: Row(
      mainAxisAlignment: _sizes.isCompact ? MainAxisAlignment.spaceEvenly : MainAxisAlignment.end,
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        imageByIndex(0),
        imageByIndex(1),
        imageByIndex(2),
      ],
    ),
  );

  Widget imageByIndex(int index) => Container(
    margin: _sizes.smallMargins.start,
    child: Hero(
      tag: '${widget.entity.type.name}_image_$index',
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: () => _showFullScreenImage(index),
          child: RawImage(
            image: _entity.images[index],
            width: _sizes.imageWidth,
            height: _sizes.imageHeight,
          ),
        ),
      ),
    ),
  );

  void _showFullScreenImage(int index) {
    final context = navigatorKey.currentContext;
    if (context == null) return;

    Navigator.of(context).push(
      PageRouteBuilder(
        opaque: false,
        barrierDismissible: true,
        pageBuilder: (context, _, __) => ImagePopupWidget(
          heroTag: '${_entity.type.name}_image_$index',
          image: _entity.images[index],
        ),
        transitionDuration: const Duration(milliseconds: 300),
      ),
    );
  }

  Widget get _smallTextDescription => Container(
    margin: _sizes.smallMargins.top,
    width: _sizes.descriptionWidth,
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _concept,
        _techno,
        _sizes.isCompact ? _compactLinks : _largeLinks,
      ],
    ),
  );

  Widget get _concept => projectText(text: _entity.concept[language]!);

  Languages get language => ref.watch(languageProvider).requireValue.language.requireValue;

  Widget get _techno => projectText(text: _entity.techno);

  Widget get _largeLinks => Row(
    crossAxisAlignment: CrossAxisAlignment.end,
    children: [
      if (_entity.links.isNotEmpty) ...[
        projectText(text: "links :"),
        AnimatedLinkWidget(sizes: _sizes, entity: _entity.links[0])
      ],
      if (_entity.links.length > 1) AnimatedLinkWidget(sizes: _sizes, entity: _entity.links[1]),
      if (_entity.links.length > 2) AnimatedLinkWidget(sizes: _sizes, entity: _entity.links[2]),
    ],
  );

  Widget get _compactLinks => Container(
    margin: _sizes.smallMargins.top,
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        if (_entity.links.isNotEmpty) ...[
          AnimatedLinkWidget(sizes: _sizes, entity: _entity.links[0])
        ],
        if (_entity.links.length > 1) AnimatedLinkWidget(sizes: _sizes, entity: _entity.links[1]),
        if (_entity.links.length > 2) AnimatedLinkWidget(sizes: _sizes, entity: _entity.links[2]),
      ],
    ),
  );

  Widget get _title => Row( children: [
    _icon,
    _name,
    _titleDelimiter,
  ],);

  Widget get _name => Container(
    margin: _sizes.mediumMargins.start,
    child: Text(
      _entity.type.name,
      style: GoogleFonts.rajdhani(
      color: MyColors.visibleText,
      fontSize: _sizes.fonts.big,
    ),),
  );

  Widget get _icon => ClipRRect(
    borderRadius: BorderRadius.all(Radius.circular(_sizes.iconBoxRadius)),
    child: RawImage(
      image: _entity.icon,
      width: _sizes.iconBox.W,
      height: _sizes.iconBox.H,
    ),
  );

  Widget projectText({required String text}) => Container(
    margin: _sizes.smallMargins.top,
    child: Text(
      text,
      style: GoogleFonts.rajdhani(
        // fontSize: sizes.fonts.medium,
        fontSize: _sizes.isCompact ? _sizes.fonts.small : _sizes.fonts.medium,
        color: MyColors.visibleText,
      ),
    ),
  );

  Widget get _titleDelimiter => Expanded(child: CustomPaint(painter: TitleDelimiterPainter()));
}