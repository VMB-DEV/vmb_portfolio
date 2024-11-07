import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:vmb_portfolio/core/data/data_source/local_data_source_picture.dart';

final pictureLocalDataSourceProvider = Provider<PictureLocalDataSource>((ref) {
  return PictureLocalDataSourceImpl();
});
