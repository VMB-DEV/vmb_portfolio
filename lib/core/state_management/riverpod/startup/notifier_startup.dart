import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:vmb_portfolio/core/state_management/riverpod/startup/state_startup.dart';

import '../../../../features/catcher/presentation/state_management/comicPic/provider_catcher_comic_pic.dart';
import '../../../../features/catcher/presentation/state_management/icons/provider_catcher_icons.dart';
import '../../../../features/catcher/presentation/state_management/text_icon_link/provider_catcher_url.dart';
import '../../../../features/contact/presentation/state_management/provider_contact_links.dart';
import '../../../../features/projects/presentation/state_management/provider_project_entities.dart';
import '../../../../main.dart';
import '../language/provider_language.dart';

class StartupNotifier extends Notifier<StartupState> {
  @override
  StartupState build() {
    initialize();
    return const StartupLoading();
  }

  Future<void> initialize() async {
    state = const StartupLoading();

    try {
      await _loadCriticalResources();
      _loadNonCriticalResources();

      state = const StartupComplete();
    } catch (e, stack) {
      state = StartupError(e, stack);
    }
  }

  Future<void> _loadCriticalResources() async {
    await Future.wait([
      ref.read(sharedPrefProvider.future),
      ref.read(languageProvider.future),
      ref.read(projectEntitiesNotifierProvider.future),
      ref.read(catcherIconsProvider.future),
      ref.read(catcherIconTextLinkProvider.future),
      ref.read(catcherComicPicProvider.future),
      ref.read(contactLinkProvider.future),
    ]);
  }

  Future<void> _loadNonCriticalResources() async {
    // Add other non-critical resources
  }

  void retry() {
    initialize();
  }
}
