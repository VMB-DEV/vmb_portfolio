import 'package:vmb_portfolio/core/presentation/state_management/riverpod/model_scroll.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final scrollRiverpod = ChangeNotifierProvider<ScrollRiverpodModel>((ref) {
  return ScrollRiverpodModel(index: 0);
});
