import 'dart:ui' as ui;
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:vmb_portfolio/core/data/repository/picture_repository.dart';
import 'package:vmb_portfolio/core/data/values/picture_type.dart';
import 'package:vmb_portfolio/features/catcher/domain/usecase/use_case_get_catcher_icon.dart';

// class PicturesNotifier extends ChangeNotifier {
//   late ui.Image pic;
//   final PictureRepository repo;
//   PicturesNotifier({
//     required this.repo
//   }){
//     _loadPic();
//   }
//
//   Future<void> _loadPic() async {
//     pic = await repo.pictureLocalDataSource.getPicture(PictureType.spaceWarsIcon.path);
//   }
// }


// class PicturesNotifier extends StateNotifier<AsyncValue<List<Object>>> {
//   final PictureRepository repo;
//
//   PicturesNotifier({required this.repo}) : super(const AsyncValue.loading()) {
//     _loadPic();
//   }
//
//   Future<void> _loadPic() async {
//     print("Loading picture...");
//     state = const AsyncValue.loading();
//     final List<Object> results = await Future.wait([
//       repo.pictureLocalDataSource.getImageUI(PictureType.spaceWarsIcon.path,),
//       repo.pictureLocalDataSource.getAssetImage(PictureType.snakeIcon.path),
//     ]);
//     try {
//       state = AsyncValue.data(results);
//       // final image = await repo.pictureLocalDataSource.getImageUI(
//       //   PictureType.spaceWarsIcon.path,
//       // );
//       print("Image loaded successfully");
//       // state = AsyncValue.data(image);
//     } catch (e, stack) {
//       print("Error loading image: $e");
//       state = AsyncValue.error(e, stack);
//     }
//   }
// }