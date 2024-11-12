import 'dart:ui';

import 'package:vmb_portfolio/core/data/values/picture_type.dart';
import 'package:vmb_portfolio/features/catcher/domain/repository/catcher_icons_repository.dart';

class GetCatcherIconsUseCase {
  final CatcherIconsRepository catcherIconsRepository;

  GetCatcherIconsUseCase({required this.catcherIconsRepository});

  Future<List<Image>> getBackGroundIcons() => catcherIconsRepository.getBackGroundIcons();
}