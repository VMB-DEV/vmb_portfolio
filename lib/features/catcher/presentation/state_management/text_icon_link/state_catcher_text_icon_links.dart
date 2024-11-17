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

  CatcherTextIconLinksState copyWith({
    AsyncValue<IconTextLinkEntity>? githubIcon,
    AsyncValue<IconTextLinkEntity>? linkedinIcon,
  }) {
    return CatcherTextIconLinksState(
      github: githubIcon ?? github,
      linkedin: linkedinIcon ?? linkedin,
    );
  }
}
