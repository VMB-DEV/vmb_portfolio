import 'package:flutter/cupertino.dart';
import 'package:vmb_portfolio/features/header/domain/entity/entity_part.dart';

class ScrollRiverpodNotifier extends ChangeNotifier {
  final scrollController = ScrollController();
  final List<GlobalKey> navBarKeys = List.generate(PartEntity.values.length - 1, (_) => GlobalKey());
  int index;
  ScrollRiverpodNotifier({
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