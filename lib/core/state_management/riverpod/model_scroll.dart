import 'package:flutter/cupertino.dart';

class ScrollRiverpodModel extends ChangeNotifier {
  final scrollController = ScrollController();
  final List<GlobalKey> navBarKeys = List.generate(4, (_) => GlobalKey());
  int index;
  ScrollRiverpodModel({
    required this.index
  });

  void updateIndexTo(int newIndex) {
    index = newIndex;
    scrollToSection(newIndex);
    notifyListeners();
  }

  void scrollToSection(int navIndex) {
    final key = navBarKeys[navIndex];
    Scrollable.ensureVisible(
      key.currentContext!,
      duration: const Duration(milliseconds: 500),
      curve: Curves.easeInOut,
    );
  }
}