import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:vmb_portfolio/core/state_management/riverpod/startup/state_startup.dart';
import 'package:vmb_portfolio/features/catcher/presentation/state_management/strings/provider_catcher_strings.dart';

import '../../../../features/catcher/presentation/state_management/comicPic/provider_catcher_comic_pic.dart';
import '../../../../features/catcher/presentation/state_management/icons/provider_catcher_icons.dart';
import '../../../../features/catcher/presentation/state_management/text_icon_link/provider_catcher_url.dart';
import '../../../../features/contact/presentation/state_management/provider_contact_links.dart';
import '../../../../features/projects/presentation/state_management/provider_project_entities.dart';
import '../../../utils/logs.dart';
import '../language/provider_language.dart';

class StartupNotifier extends Notifier<StartupState> {
  @override
  StartupState build() {
    initialize();
    return const StartupState();
  }

  Future<void> initialize() async {
    state = const StartupState(loaded: AsyncValue.loading());

    try {
      await ref.read(sharedPrefProvider.future);

      final languageState = await ref.read(languageProvider.future);
      await languageState.language.value; // Ensure language is loaded

      final stringsState = await ref.read(catcherStringsNotifierProvider.future);
      await stringsState.entity.value; // Ensure strings are loaded

      await Future.wait([
        ref.read(catcherIconsProvider.future),
        ref.read(catcherIconTextLinkProvider.future),
        ref.read(catcherComicPicProvider.future),
        ref.read(contactLinkProvider.future),
        ref.read(projectEntitiesNotifierProvider.future),
        // ref.read(catcherStringsNotifierProvider.future),
      ]);

      state = const StartupState(loaded: AsyncValue.data(true));
    } catch (e, stack) {
      state = StartupState(loaded: AsyncValue.error(e, stack));
    }
  }


  void retry() {
    initialize();
  }
}
