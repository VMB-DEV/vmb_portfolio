import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:vmb_portfolio/features/catcher/domain/usecase/use_case_get_catcher_comic_pic.dart';
import 'package:vmb_portfolio/features/catcher/presentation/state_management/comicPic/notifier_catcher_comic_pic.dart';
import 'package:vmb_portfolio/features/catcher/presentation/state_management/comicPic/state_catcher_comic_pic.dart';
import '../icons/provider_catcher_icons.dart';

final catcherComicPicUseCaseProvider = Provider<GetCatcherComicPicUseCase>((ref) {
  final repository = ref.watch(catcherIconsRepositoryProvider);
  return GetCatcherComicPicUseCase(catcherIconsRepository: repository);
});

final catcherComicPicProvider = AsyncNotifierProvider<CatcherComicPicNotifier, CatcherComicPicState>(() {
  return CatcherComicPicNotifier();
});
