import 'dart:ui' as ui;
import 'package:vmb_portfolio/core/data/data_source/local_data_source_picture.dart';
import 'package:vmb_portfolio/core/data/values/picture_type.dart';
import 'package:vmb_portfolio/features/catcher/domain/repository/catcher_icons_repository.dart';
import 'package:vmb_portfolio/features/contact/domain/repository/repository_contact_link.dart';

class PictureRepository extends CatcherIconsRepository with ContactLinksRepository {
  final PictureLocalDataSource pictureLocalDataSource;

  PictureRepository({required this.pictureLocalDataSource});

  @override
  Future<ui.Image> getCatcherLinkIcon(PictureType type) {
    if (type.isCatcherIcon) {
      return pictureLocalDataSource.getImageUI(type.path);
    } else {
      throw Exception("IconsRepository.getCatcherImage error");
    }
  }

  @override
  Future<List<ui.Image>> getBackGroundImages() {
    return pictureLocalDataSource.getImageUIList(PictureType.slidingIcons.map((type) => type.path).toList());
  }

  @override
  Future<ui.Image> getContactLinks(PictureType type) {
    if (type.isContactIcon) {
      return pictureLocalDataSource.getImageUI(type.path);
    } else {
      throw Exception("PictureRepository.getContactLinks type error");
    }
  }

  @override
  Future<ui.Image> getComicPic() {
    return pictureLocalDataSource.getImageUI(PictureType.me.path);
  }
}