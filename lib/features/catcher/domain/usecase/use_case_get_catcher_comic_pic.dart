import 'dart:ui' as ui;

import 'package:vmb_portfolio/features/catcher/domain/repository/catcher_icons_repository.dart';

class GetCatcherComicPicUseCase {
  final CatcherIconsRepository catcherIconsRepository;

  GetCatcherComicPicUseCase({required this.catcherIconsRepository});

  Future<ui.Image> call() => catcherIconsRepository.getComicPic();
}
