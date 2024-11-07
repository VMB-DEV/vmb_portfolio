import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:vmb_portfolio/features/catcher/presentation/state_management/icons/state_catcher_icons.dart';

import '../../../../../core/data/repository/picture_repository.dart';
import '../../../../../core/state_management/riverpod/pictures/provider_pictures.dart';
import '../../../domain/usecase/use_case_get_catcher_icon.dart';
import 'notifier_catcher_icons.dart';

final catcherIconsRepositoryProvider = Provider<PictureRepository>((ref) {
  final localDataSource = ref.watch(pictureLocalDataSourceProvider);
  return PictureRepository(pictureLocalDataSource: localDataSource);
});

final catcherIconsUseCaseProvider = Provider<GetCatcherIconsUseCase>((ref) {
  final repository = ref.watch(catcherIconsRepositoryProvider);
  return GetCatcherIconsUseCase(catcherIconsRepository: repository);
});

final catcherIconsProvider = AsyncNotifierProvider<CatcherIconsNotifier, CatcherIconsState>(() {
  return CatcherIconsNotifier();
});

