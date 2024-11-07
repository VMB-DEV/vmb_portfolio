import 'dart:async';
import 'dart:ui';
import 'package:flutter/services.dart';

import '../../utils/logs.dart';

abstract class PictureLocalDataSource {
  Future<Image> getPicture(String path);
  Future<List<Image>> getPictures(List<String> paths);
}

class PictureLocalDataSourceImpl extends PictureLocalDataSource {
  @override
  Future<Image> getPicture(String path) async {
    final ByteData data = await rootBundle.load(path);
    final Completer<Image> completer = Completer();
    decodeImageFromList(Uint8List.view(data.buffer), (Image img) {
      completer.complete(img);
    });
    final image = await completer.future;
    return image;
  }

  @override
  Future<List<Image>> getPictures(List<String> paths) async {
    return Future.wait(paths.map((type) => getPicture(type)).toList());
  }
}