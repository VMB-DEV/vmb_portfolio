import 'dart:ui' as ui;

import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../../core/data/values/picture_type.dart';

class CatcherIconsState {
  final AsyncValue<ui.Image> githubIcon;
  final AsyncValue<ui.Image> linkedinIcon;

  const CatcherIconsState({
    this.githubIcon = const AsyncValue.loading(),
    this.linkedinIcon = const AsyncValue.loading(),
  });


  AsyncValue<ui.Image> byType(PictureType type) => switch (type) {
    PictureType.github => githubIcon,
    PictureType.linkedin => linkedinIcon,
    _ => throw Exception("CatcherIconState.byType() Error, PictureType unhandled" ),
  };
  CatcherIconsState copyWith({
    AsyncValue<ui.Image>? githubIcon,
    AsyncValue<ui.Image>? linkedinIcon,
  }) {
    return CatcherIconsState(
      githubIcon: githubIcon ?? this.githubIcon,
      linkedinIcon: linkedinIcon ?? this.linkedinIcon,
    );
  }
}
