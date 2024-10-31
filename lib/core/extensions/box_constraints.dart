import 'package:flutter/material.dart';

extension BoxConstraintsExtension on BoxConstraints {
  double get H => maxHeight;
  double get W => maxWidth;
  double get maxH => maxHeight;
  double get maxW => maxWidth;
}
