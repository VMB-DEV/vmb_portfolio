import 'dart:ui';

import 'package:vmb_portfolio/core/data/data_source/local_data_source_picture.dart';
import 'package:vmb_portfolio/core/data/values/picture_type.dart';
import 'package:vmb_portfolio/features/catcher/domain/repository/catcher_icons_repository.dart';

class PictureRepository extends CatcherIconsRepository {
  final PictureLocalDataSource pictureLocalDataSource;

  PictureRepository({required this.pictureLocalDataSource});

  @override
  Future<Image> getCatcherImage(PictureType type) {
    if (type.isCatcherIcon) {
      return pictureLocalDataSource.getPicture(type.path);
    } else {
      throw Exception("IconsRepository.getCatcherImage error");
    }
  }

}