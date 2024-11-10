import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:vmb_portfolio/core/constants/custom_colors.dart';
import 'package:vmb_portfolio/core/extensions/box_constraints.dart';
import 'package:vmb_portfolio/core/presentation/pictures/painter_picture.dart';
import 'package:vmb_portfolio/core/presentation/text/animated_link_widget.dart';
import 'package:vmb_portfolio/core/utils/contruction.dart';
import 'package:vmb_portfolio/features/projects/domain/entity/entity_project.dart';
import 'package:vmb_portfolio/features/projects/presentation/page/painter_title_delimiter.dart';
import 'package:vmb_portfolio/features/projects/presentation/page/sizes_projects.dart';
import '../../Project.dart';

class ProjectWidget extends StatelessWidget {
  final ProjectEntity entity;
  final ProjectsSizes sizes;
  const ProjectWidget({
    required this.entity,
    required this.sizes,
    super.key,
  });

  BoxConstraints get box => sizes.projectBox;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: sizes.leftPartMargin.add(sizes.mediumMargins.bot),
      // constraints: box,
      // color: MyColors.test1,
      child: Column(
        children: [
          _title,
          _compactDescription
        ],
      ),
    );
  }
  Widget get _compactDescription => Container(
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _compactTextDescription,
        _compactAssetDescription,
      ],
    ),
  );

  Widget get _compactAssetDescription => Container(
    // color: MyColors.test3,
    margin: sizes.smallMargins.top
        .add(sizes.smallMargins.top)
        .add(sizes.rightPartMargin)
    ,
    child: Row(
      mainAxisAlignment: MainAxisAlignment.end,
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        imageByIndex(0),
        imageByIndex(1),
        imageByIndex(2),
      ],
    ),
  );

  Widget imageByIndex(int index) => Container(
    margin: sizes.smallMargins.start,
    child: RawImage(
      image: entity.images[index],
      width: sizes.screen.W * 0.13,
      height: sizes.screen.W * 0.19,
    ),
  );

  Widget get _compactTextDescription => Container(
    // color: MyColors.test2,
    margin: sizes.smallMargins.top,
    width: sizes.descriptionWidth,
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _concept,
        _techno,
        _links,
      ],
    ),
  );

  Widget get _concept => projectText(text: entity.concept);
  Widget get _techno => projectText(text: entity.techno);
  Widget get _links => Row(
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
        fontSize: sizes.fonts.medium,
        color: MyColors.visibleText,
      ),
    ),
  );

  Widget get _titleDelimiter => Expanded(child: CustomPaint(painter: TitleDelimiterPainter()));
  double get _titleHeight => box.H * 0.15;
  double get _conceptHeight => box.H * 0.30;
  double get _technoHeight => box.H * 0.15;

  EdgeInsetsDirectional get _verticalMargin => EdgeInsetsDirectional.only(top: box.H * 0.15);
  EdgeInsetsDirectional get _horizontalMargin => EdgeInsetsDirectional.only(end: box.W * 0.08);
}
