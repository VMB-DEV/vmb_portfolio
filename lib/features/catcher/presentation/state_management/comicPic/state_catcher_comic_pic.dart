import 'dart:ui' as ui;

import 'package:flutter_riverpod/flutter_riverpod.dart';

class CatcherComicPicState {
  final AsyncValue<ui.Image> comicPic;

  const CatcherComicPicState({
    this.comicPic = const AsyncValue.loading(),
  });

  CatcherComicPicState copyWith({
    AsyncValue<ui.Image>? comicPic,
  }) {
    return CatcherComicPicState(
      comicPic: comicPic ?? this.comicPic,
    );
  }
}
