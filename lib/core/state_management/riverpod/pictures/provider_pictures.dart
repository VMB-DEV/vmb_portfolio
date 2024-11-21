import 'dart:ui' as ui;

import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:vmb_portfolio/core/data/data_source/local_data_source_picture.dart';
import 'package:vmb_portfolio/core/data/repository/picture_repository.dart';
import 'package:vmb_portfolio/core/state_management/riverpod/pictures/notifier_pictures.dart';

// final pictureLocalDataSourceProvider = Provider<PictureLocalDataSource>((ref) {
//   return PictureLocalDataSourceImpl();
// });
//
// final pictureRepotoryProvider = Provider<PictureRepository>((ref) {
//   final localDataSource = ref.read(pictureLocalDataSourceProvider);
//   return PictureRepository(pictureLocalDataSource: localDataSource);
// });
//
// // final providerPictureNotifier  = ChangeNotifierProvider<PicturesNotifier>((ref) {
// //   final repo = ref.read(pictureRepoProvider);
// //   return PicturesNotifier(repo: repo);
// // });
// final picturesProvider = StateNotifierProvider<PicturesNotifier, AsyncValue<ui.Image>>((ref) {
//   final repo = ref.watch(pictureRepotoryProvider);
//   return PicturesNotifier(repo: repo);
// });




// Riverpod providers

// Provider for the local data source
final pictureLocalDataSourceProvider = Provider((ref) => PictureLocalDataSourceImpl());

// Provider for the repository
// final pictureRepositoryProvider = Provider((ref) {
//   final localDataSource = ref.watch(pictureLocalDataSourceProvider);
//   return PictureRepository(pictureLocalDataSource: localDataSource);
// });

// StateNotifierProvider to manage image loading
// final pictureProvider = StateNotifierProvider<PicturesNotifier, AsyncValue<List<Object>>>((ref) {
//   final repository = ref.watch(pictureRepositoryProvider);
//   return PicturesNotifier(repo: repository);
// });