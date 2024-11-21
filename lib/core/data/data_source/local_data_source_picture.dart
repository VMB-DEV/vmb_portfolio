import 'dart:async';
import 'dart:ui' as ui;
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../constants/config_path.dart';

final Stopwatch myStopwatch = Stopwatch();

abstract class PictureLocalDataSource {
  // Future<AssetImage> getAssetImage(String path);
  // Future<List<AssetImage>> getAssetImageList(List<String> paths);
  Future<ui.Image> getImageUI(String path);
  Future<List<ui.Image>> getImageUIList(List<String> paths);
}

class PictureLocalDataSourceImpl extends PictureLocalDataSource {
  // @override
  // Future<AssetImage> getAssetImage(String path) async {
  //   return AssetImage("/$path");
  // }
  //
  // @override
  // Future<List<AssetImage>> getAssetImageList(List<String> paths) {
  //   return Future.wait(paths.map((type) => getAssetImage(type)).toList());
  // }

  @override
  Future<List<ui.Image>> getImageUIList(List<String> paths) {
    return Future.wait(paths.map((type) => getImageUI(type)).toList());
  }

  @override
  Future<ui.Image> getImageUI(String path) async {
    final String assetPath = PathConfig.getAssetPath(path);
    final ByteData data = await rootBundle.load(assetPath);
    final Uint8List bytes = data.buffer.asUint8List();
    final ui.Codec codec = await instantiateImageCodec(bytes);
    final FrameInfo fi = await codec.getNextFrame();
    return fi.image;
  }
}