import 'dart:ui' as ui;
import 'package:vmb_portfolio/core/data/values/picture_type.dart';

abstract class CatcherIconsRepository {
  Future<ui.Image> getCatcherLinkIcon(PictureType type);
  Future<List<ui.Image>> getBackGroundImages();
  Future<ui.Image> getComicPic();
}