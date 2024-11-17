import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'notifier_scroll.dart';

final scrollRiverpod = ChangeNotifierProvider<ScrollRiverpodNotifier>((ref) {
  return ScrollRiverpodNotifier(index: 0);
});
