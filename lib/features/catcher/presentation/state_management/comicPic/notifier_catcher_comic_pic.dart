import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:vmb_portfolio/features/catcher/presentation/state_management/comicPic/provider_catcher_comic_pic.dart';
import 'package:vmb_portfolio/features/catcher/presentation/state_management/comicPic/state_catcher_comic_pic.dart';

class CatcherComicPicNotifier extends AsyncNotifier<CatcherComicPicState> {
  @override
  Future<CatcherComicPicState> build() async {
    return _loadAllIcons();
  }

  Future<CatcherComicPicState> _loadAllIcons() async {
    final useCase = ref.watch(catcherComicPicUseCaseProvider);

    try {
      final results = await Future.wait([
        useCase.call(),
      ]);

      return CatcherComicPicState(
        comicPic: AsyncValue.data(results[0]),
      );
    } catch (e, stack) {
      return CatcherComicPicState(
        comicPic: AsyncValue.error(e, stack),
      );
    }
  }
}
