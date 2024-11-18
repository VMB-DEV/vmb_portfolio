import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:vmb_portfolio/core/data/repository/language_repository.dart';
import 'package:vmb_portfolio/core/state_management/riverpod/language/provider_language.dart';
import 'package:vmb_portfolio/core/state_management/riverpod/language/state_language.dart';

import '../../../data/values/languages.dart';

class LanguageNotifier extends AsyncNotifier<LanguageState> {
  // final LanguageRepository repo;

  // LanguageNotifier({required this.repo});
  @override
  Future<LanguageState> build() async {
    return _init();
  }

  Future<LanguageState> _init() async {
    try {
      final repo = await ref.watch(languageRepoProvider.future);
      final language = repo.getLanguage();
      return LanguageState(language: AsyncValue.data(language));
    } catch (e, stack) {
      return LanguageState(language: AsyncValue.error(e, stack));
    }
  }

  Future<void> switchLanguage() async {
    state = const AsyncValue.loading();

    try {
      final repo = await ref.watch(languageRepoProvider.future);
      final currentState = state.valueOrNull;
      if (currentState == null) return;

      final newLanguage = currentState.isFrench ? Languages.english : Languages.french;
      repo.setLanguage(newLanguage);

      state = AsyncValue.data(LanguageState( language: AsyncValue.data(newLanguage) ));
    } catch (e, stack) {
      state = AsyncValue.error(e, stack);
    }
  }

  Future<void> setLanguage(Languages language) async {
    final repo = await ref.watch(languageRepoProvider.future);
    state = const AsyncValue.loading();

    try {
      repo.setLanguage(language);
      state = AsyncValue.data(LanguageState( language: AsyncValue.data(language) ));
    } catch (e, stack) {
      state = AsyncValue.error(e, stack);
    }
  }}
