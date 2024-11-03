import 'dart:ui';

extension PathExtension on Path {
  void moveToOffset(Offset offset, {double? dx, double? dy}) {
    moveTo(
      dx == null ? offset.dx : offset.dx + dx,
      dy == null ? offset.dy : offset.dy + dy,
    );
  }

  void lineToOffset(Offset offset, {double? dx, double? dy}) {
    lineTo(
      dx == null ? offset.dx : offset.dx + dx,
      dy == null ? offset.dy : offset.dy + dy,
    );
  }
}