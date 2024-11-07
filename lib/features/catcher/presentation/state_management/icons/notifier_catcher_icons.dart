import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:vmb_portfolio/features/catcher/presentation/state_management/icons/provider_catcher_icons.dart';
import 'package:vmb_portfolio/features/catcher/presentation/state_management/icons/state_catcher_icons.dart';

class CatcherIconsNotifier extends AsyncNotifier<CatcherIconsState> {
  @override
  Future<CatcherIconsState> build() async {
    return _loadAllIcons();
  }

  Future<CatcherIconsState> _loadAllIcons() async {
    final useCase = ref.watch(catcherIconsUseCaseProvider);

    try {
      final results = await Future.wait([
        useCase.getGithubIcon(),
        useCase.getLinkedinIcon(),
      ]);

      return CatcherIconsState(
        githubIcon: AsyncValue.data(results[0]),
        linkedinIcon: AsyncValue.data(results[1]),
      );
    } catch (e, stack) {
      return CatcherIconsState(
        githubIcon: AsyncValue.error(e, stack),
        linkedinIcon: AsyncValue.error(e, stack),
      );
    }
  }
}