import 'package:flutter/material.dart';
import 'package:vmb_portfolio/core/constants/custom_colors.dart';
import 'package:vmb_portfolio/core/extensions/box_constraints.dart';
import 'package:vmb_portfolio/core/utils/contruction.dart';
import 'package:vmb_portfolio/features/projects/presentation/page/painter_title_delimiter.dart';
import 'package:vmb_portfolio/features/projects/presentation/page/sizes_projects.dart';
import '../../Project.dart';

class ProjectWidget extends StatelessWidget {
  final Project type;
  final ProjectsSizes sizes;
  const ProjectWidget({
    required this.type,
    required this.sizes,
    super.key,
  });

  BoxConstraints get box => sizes.projectBox;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: sizes.leftPartMargin,
      constraints: box,
      color: MyColors.test1,
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
      children: [
        _compactTextDescription,
        _compactAssetDescription,
      ],
    ),
  );

  Widget get _compactAssetDescription => Container(
    color: MyColors.test3,
    child: Row(
      mainAxisAlignment: MainAxisAlignment.end,
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        _image("Image 1"),
        _image("Image 2"),
        _image("Image 3"),
      ],
    ),
  );
  Widget _image(String str) => Container(
    margin: _horizontalMargin,
    child: ToConstruct(height: box.H - _titleHeight, width: 200, str: str),
  );
  Widget get _compactTextDescription => Container(
    color: MyColors.test2,
    margin: _verticalMargin,
    child: Column(
      children: [
        _concept,
        _techno
      ],
    ),
  );

  Widget get _concept => ToConstruct(height: _conceptHeight, width: 500, str: "concept");
  Widget get _techno => ToConstruct(height: _technoHeight, width: 500, str: "techno");

  Widget get _title => Row( children: [
    _icon,
    _name,
    _titleDelimiter,
  ],);
  Widget get _name => ToConstruct(height: _titleHeight, width: 300, str: "name");
  Widget get _icon => ToConstruct(height: _titleHeight, width: _titleHeight, str: "icon");
  Widget get _titleDelimiter => Expanded(child: CustomPaint(painter: TitleDelimiterPainter()));
  double get _titleHeight => box.H * 0.15;
  double get _conceptHeight => box.H * 0.30;
  double get _technoHeight => box.H * 0.15;

  EdgeInsetsDirectional get _verticalMargin => EdgeInsetsDirectional.only(top: box.H * 0.15);
  EdgeInsetsDirectional get _horizontalMargin => EdgeInsetsDirectional.only(end: box.W * 0.08);
}
