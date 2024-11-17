import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:vmb_portfolio/features/catcher/presentation/state_management/icons/provider_catcher_icons.dart';
import 'package:vmb_portfolio/features/contact/presentation/state_management/provider_contact_links.dart';
import 'package:vmb_portfolio/features/contact/presentation/state_management/state_contact_links.dart';

class ContactLinksNotifier extends AsyncNotifier<ContactLinksState> {
  @override
  Future<ContactLinksState> build() async {
    return _loadAllIcons();
  }

  Future<ContactLinksState> _loadAllIcons() async {
    final useCase = ref.watch(contactLinkUseCaseProvider);

    try {
      final results = await Future.wait([
        useCase.getGithubLink,
        useCase.getLinkedin,
        useCase.getMailLink,
      ]);

      return ContactLinksState(
        github: AsyncValue.data(results[0]),
        linkedin: AsyncValue.data(results[1]),
        mail: AsyncValue.data(results[2]),
      );
    } catch (e, stack) {
      return ContactLinksState(
        github: AsyncValue.error(e, stack),
        linkedin: AsyncValue.error(e, stack),
      );
    }
  }
}
