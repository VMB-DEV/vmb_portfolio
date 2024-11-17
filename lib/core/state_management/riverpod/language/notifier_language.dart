import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:vmb_portfolio/core/state_management/riverpod/language/provider_language.dart';

import '../../../data/values/languages.dart';

class LanguageNotifier extends StateNotifier<AsyncValue<Languages>> {
  final Ref ref;

  bool get isFrench => state.requireValue == Languages.french;
  bool get isEnglish => state.requireValue == Languages.english;

  LanguageNotifier(this.ref) : super(const AsyncValue.loading()) {
    _init();
  }

  Future<void> _init() async {
    try {
      final repository = await ref.read(languageRepoProvider.future);
      final language = repository.getLanguage();
      state = AsyncValue.data(language);
    } catch (e, stack) {
      state = AsyncValue.error(e, stack);
    }
  }

  Future<void> switchLanguage() async {
    state = const AsyncValue.loading();
    try {
      final repository = await ref.read(languageRepoProvider.future);
      final newLanguage = isFrench ? Languages.english : Languages.french;
      repository.setLanguage(newLanguage);
      state = AsyncValue.data(newLanguage);
    } catch (e, stack) {
      state = AsyncValue.error(e, stack);
    }
  }

  Future<void> setLanguage(Languages language) async {
    state = const AsyncValue.loading();
    try {
      final repository = await ref.read(languageRepoProvider.future);
      repository.setLanguage(language);
      state = AsyncValue.data(language);
    } catch (e, stack) {
      state = AsyncValue.error(e, stack);
    }
  }
}
