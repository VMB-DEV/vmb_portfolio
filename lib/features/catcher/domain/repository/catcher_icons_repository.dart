import 'dart:ui';
import 'package:vmb_portfolio/core/data/values/picture_type.dart';

abstract class CatcherIconsRepository {
  Future<Image> getCatcherImage(PictureType type);
  Future<List<Image>> getBackGroundIcons();
}