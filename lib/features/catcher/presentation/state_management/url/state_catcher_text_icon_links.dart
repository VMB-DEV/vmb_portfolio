import 'dart:ui';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:vmb_portfolio/features/catcher/domain/entity/entity_icon_text_link.dart';

class CatcherTextIconLinksState {
  final AsyncValue<IconTextLinkEntity> github;
  final AsyncValue<IconTextLinkEntity> linkedin;

  const CatcherTextIconLinksState( {
    this.github = const AsyncValue.loading(),
    this.linkedin = const AsyncValue.loading(),
  });

  // AsyncValue<Image>  => switch (type) {
  // AsyncValue<Image> byType(PictureType type) => switch (type) {
  //   PictureType.github => githubIcon,
  //   PictureType.linkedin => linkedinIcon,
  //   _ => throw Exception("CatcherIconState.byType() Error, PictureType unhandled" ),
  // };
  CatcherTextIconLinksState copyWith({
    AsyncValue<Image>? githubIcon,
    AsyncValue<Image>? linkedinIcon,
  }) {
    return CatcherTextIconLinksState(
      github: github ?? this.github,
      linkedin: linkedin ?? this.linkedin,
    );
  }
}
