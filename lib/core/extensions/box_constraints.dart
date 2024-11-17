import 'package:flutter/material.dart';

extension BoxConstraintsExtension on BoxConstraints {
  double get H => maxHeight;
  double get W => maxWidth;
  double get maxH => maxHeight;
  double get maxW => maxWidth;
  bool get isCompact => W < 700;
  EdgeInsetsDirectional get mainLeftMargin => EdgeInsetsDirectional.only(start: W * 0.11);
  EdgeInsetsDirectional get mainTopMargin => EdgeInsetsDirectional.only(top: H * 0.07);
  EdgeInsetsDirectional get mainBotMargin => EdgeInsetsDirectional.only(bottom: H * 0.07);
  EdgeInsetsDirectional get mainRightMargin => EdgeInsetsDirectional.only(start: W * 0.9);
}
