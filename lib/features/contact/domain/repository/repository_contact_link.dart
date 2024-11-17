import 'dart:ui' as ui;
import '../../../../core/data/values/picture_type.dart';

mixin ContactLinksRepository {
  Future<ui.Image> getContactLinks(PictureType type);
}