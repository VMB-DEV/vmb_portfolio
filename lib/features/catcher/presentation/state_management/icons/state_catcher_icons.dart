import 'dart:ui' as ui;
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CatcherIconsState {
  final AsyncValue<List<ui.Image>> backgroundIcons;

  const CatcherIconsState({
    this.backgroundIcons = const AsyncValue.loading(),
  });

  CatcherIconsState copyWith({
    AsyncValue<List<ui.Image>>? backgroundIcons,
  }) {
    return CatcherIconsState(
      backgroundIcons: backgroundIcons ?? this.backgroundIcons,
    );
  }
}
