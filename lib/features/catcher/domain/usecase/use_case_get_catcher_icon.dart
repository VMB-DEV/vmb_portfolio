import 'dart:ui' as ui;

import 'package:vmb_portfolio/features/catcher/domain/repository/catcher_icons_repository.dart';

class GetCatcherIconsUseCase {
  final CatcherIconsRepository catcherIconsRepository;

  GetCatcherIconsUseCase({required this.catcherIconsRepository});

  Future<List<ui.Image>> getBackGroundIcons() => catcherIconsRepository.getBackGroundImages();
}