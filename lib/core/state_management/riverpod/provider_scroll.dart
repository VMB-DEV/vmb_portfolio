import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'model_scroll.dart';

final scrollRiverpod = ChangeNotifierProvider<ScrollRiverpodModel>((ref) {
  return ScrollRiverpodModel(index: 0);
});
