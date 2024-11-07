import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:vmb_portfolio/features/catcher/presentation/state_management/url/provider_catcher_url.dart';
import 'package:vmb_portfolio/features/catcher/presentation/state_management/url/state_catcher_text_icon_links.dart';

class CatcherTextIconLinksNotifier extends AsyncNotifier<CatcherTextIconLinksState> {
  @override
  Future<CatcherTextIconLinksState> build() async {
    return _loadAllIcons();
  }

  Future<CatcherTextIconLinksState> _loadAllIcons() async {
    final useCase = ref.watch(catcherTextIconLinkUseCaseProvider);

    try {
      final results = await Future.wait([
        useCase.github(),
        useCase.linkedin(),
      ]);

      return CatcherTextIconLinksState(
        github: AsyncValue.data(results[0]),
        linkedin: AsyncValue.data(results[1]),
      );
    } catch (e, stack) {
      return CatcherTextIconLinksState(
        github: AsyncValue.error(e, stack),
        linkedin: AsyncValue.error(e, stack),
      );
    }
  }
}
