import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../catcher/domain/entity/entity_icon_text_link.dart';

class ContactLinksState {
  final AsyncValue<IconTextLinkEntity> github;
  final AsyncValue<IconTextLinkEntity> linkedin;
  final AsyncValue<IconTextLinkEntity> mail;

  const ContactLinksState( {
    this.github = const AsyncValue.loading(),
    this.linkedin = const AsyncValue.loading(),
    this.mail = const AsyncValue.loading(),
  });

  ContactLinksState copyWith({
    AsyncValue<IconTextLinkEntity>? githubIcon,
    AsyncValue<IconTextLinkEntity>? linkedinIcon,
    AsyncValue<IconTextLinkEntity>? mail,
  }) {
    return ContactLinksState(
      github: githubIcon ?? github,
      linkedin: linkedinIcon ?? linkedin,
      mail: linkedinIcon ?? linkedin,
    );
  }
}
