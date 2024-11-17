import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:vmb_portfolio/features/catcher/domain/repository/catcher_urls_repository.dart';
import 'package:vmb_portfolio/features/catcher/domain/usecase/use_case_get_catcher_icon_text_link.dart';
import 'package:vmb_portfolio/features/catcher/presentation/state_management/text_icon_link/state_catcher_text_icon_links.dart';

import '../../../../../core/data/repository/picture_repository.dart';
import '../../../../../core/data/repository/url_repository.dart';
import '../../../../../core/state_management/riverpod/pictures/provider_pictures.dart';
import 'notifier_catcher_text_icon_link.dart';

final catcherIconsRepositoryProvider = Provider<PictureRepository>((ref) {
  final localDataSource = ref.read(pictureLocalDataSourceProvider);
  return PictureRepository(pictureLocalDataSource: localDataSource);
});

final catcherUrlRepositoryProvider = Provider<UrlRepository>((ref) {
  return UrlRepository();
});

final catcherTextIconLinkUseCaseProvider = Provider<GetCatcherIconTextLinkUseCase>((ref) {
  final iconsRepository = ref.read(catcherIconsRepositoryProvider);
  final urlRepository = ref.read(catcherUrlRepositoryProvider);
  return GetCatcherIconTextLinkUseCase(
    catcherUrlsRepository: urlRepository,
    catcherIconsRepository: iconsRepository,
  );
});

final catcherIconTextLinkProvider = AsyncNotifierProvider<CatcherTextIconLinksNotifier, CatcherTextIconLinksState>(() {
  return CatcherTextIconLinksNotifier();
});
