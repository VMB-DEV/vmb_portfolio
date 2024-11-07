import 'package:flutter/cupertino.dart';

class MarginSize {
  final double horizontalValue;
  final double verticalValue;

  late EdgeInsetsDirectional top;
  late EdgeInsetsDirectional bot;
  late EdgeInsetsDirectional start;
  late EdgeInsetsDirectional end;
  late EdgeInsetsDirectional horizontal;
  late EdgeInsetsDirectional vertical;

  MarginSize({
    required this.horizontalValue,
    required this.verticalValue,
  }) {
    top = EdgeInsetsDirectional.only(top: verticalValue);
    bot = EdgeInsetsDirectional.only(bottom: verticalValue);
    start = EdgeInsetsDirectional.only(start: horizontalValue);
    end = EdgeInsetsDirectional.only(end: horizontalValue);
    vertical = EdgeInsetsDirectional.symmetric(vertical: horizontalValue);
    horizontal = EdgeInsetsDirectional.symmetric(horizontal: verticalValue);
  }
}