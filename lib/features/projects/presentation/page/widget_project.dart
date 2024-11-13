import 'dart:ui' as ui;
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:vmb_portfolio/core/constants/custom_colors.dart';
import 'package:vmb_portfolio/core/extensions/box_constraints.dart';
import 'package:vmb_portfolio/core/presentation/text/animated_link_widget.dart';
import 'package:vmb_portfolio/features/projects/domain/entity/entity_project.dart';
import 'package:vmb_portfolio/features/projects/presentation/page/painter_title_delimiter.dart';
import 'package:vmb_portfolio/features/projects/presentation/page/sizes_projects.dart';
import 'package:vmb_portfolio/features/projects/presentation/page/widget_image_popup.dart';

import '../../../../main.dart';

class ProjectWidget extends StatelessWidget {
  final ProjectEntity entity;
  final ProjectsSizes sizes;
  const ProjectWidget({
    required this.entity,
    required this.sizes,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: sizes.leftPartMargin.add(sizes.mediumMargins.bot),
      child: Column(
        children: [
          _title,
          sizes.isCompact ? _compactLayout : _largeLayout,
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
    margin: sizes.smallMargins.top
        .add(sizes.smallMargins.top)
        .add(sizes.rightPartMargin)
    ,
    child: Row(
      mainAxisAlignment: sizes.isCompact ? MainAxisAlignment.spaceEvenly : MainAxisAlignment.end,
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        imageByIndex(0),
        imageByIndex(1),
        imageByIndex(2),
      ],
    ),
  );

  // Widget imageByIndex(int index) => Container(
  //   margin: sizes.smallMargins.start,
  //   child: RawImage(
  //     image: entity.images[index],
  //     width: sizes.imageWidth,
  //     height: sizes.imageHeight,
  //   ),
  // );
  Widget imageByIndex(int index) => Container(
    margin: sizes.smallMargins.start,
    child: Hero(
      tag: '${entity.type.name}_image_$index',
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: () => _showFullScreenImage(index),
          child: RawImage(
            image: entity.images[index],
            width: sizes.imageWidth,
            height: sizes.imageHeight,
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
          heroTag: '${entity.type.name}_image_$index',
          image: entity.images[index],
        ),
        transitionDuration: const Duration(milliseconds: 300),
      ),
    );
  }



  Widget get _smallTextDescription => Container(
    margin: sizes.smallMargins.top,
    width: sizes.descriptionWidth,
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _concept,
        _techno,
        sizes.isCompact ? _compactLinks : _largeLinks,
      ],
    ),
  );

  Widget get _concept => projectText(text: entity.concept);
  Widget get _techno => projectText(text: entity.techno);
  Widget get _largeLinks => Row(
    crossAxisAlignment: CrossAxisAlignment.end,
    children: [
      if (entity.links.isNotEmpty) ...[
        projectText(text: "links :"),
        AnimatedLinkWidget(sizes: sizes, entity: entity.links[0])
      ],
      if (entity.links.length > 1) AnimatedLinkWidget(sizes: sizes, entity: entity.links[1]),
      if (entity.links.length > 2) AnimatedLinkWidget(sizes: sizes, entity: entity.links[2]),
    ],
  );

  Widget get _compactLinks => Container(
    margin: sizes.smallMargins.top,
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        if (entity.links.isNotEmpty) ...[
          AnimatedLinkWidget(sizes: sizes, entity: entity.links[0])
        ],
        if (entity.links.length > 1) AnimatedLinkWidget(sizes: sizes, entity: entity.links[1]),
        if (entity.links.length > 2) AnimatedLinkWidget(sizes: sizes, entity: entity.links[2]),
      ],
    ),
  );

  Widget get _title => Row( children: [
    _icon,
    _name,
    _titleDelimiter,
  ],);

  Widget get _name => Container(
    margin: sizes.mediumMargins.start,
    child: Text(
      entity.type.name,
      style: GoogleFonts.rajdhani(
      color: MyColors.visibleText,
      fontSize: sizes.fonts.big,
    ),),
  );
  Widget get _icon => ClipRRect(
    borderRadius: BorderRadius.all(Radius.circular(sizes.iconBoxRadius)),
    child: RawImage(
      image: entity.icon,
      width: sizes.iconBox.W,
      height: sizes.iconBox.H,
    ),
  );

  Widget projectText({required String text}) => Container(
    margin: sizes.smallMargins.top,
    child: Text(
      text,
      style: GoogleFonts.rajdhani(
        // fontSize: sizes.fonts.medium,
        fontSize: sizes.isCompact ? sizes.fonts.small : sizes.fonts.medium,
        color: MyColors.visibleText,
      ),
    ),
  );

  Widget get _titleDelimiter => Expanded(child: CustomPaint(painter: TitleDelimiterPainter()));
}

