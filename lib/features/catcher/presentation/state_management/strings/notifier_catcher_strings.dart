import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:vmb_portfolio/core/state_management/riverpod/language/provider_language.dart';
import 'package:vmb_portfolio/features/catcher/presentation/state_management/strings/provider_catcher_strings.dart';
import 'package:vmb_portfolio/features/catcher/presentation/state_management/strings/state_catcher_strings.dart';

import '../../../../../core/data/values/languages.dart';

class CatcherStringsNotifier extends AsyncNotifier<CatcherStringsState> {
  @override
  FutureOr<CatcherStringsState> build() {
    return ref.watch(languageProvider).when(
      data: (state) => _init(state.language),
      loading: () => const CatcherStringsState(),
      error: (e, stack) => CatcherStringsState(entity: AsyncValue.error(e, stack)),
    );
  }

  Future<CatcherStringsState> _init(AsyncValue<Languages> language) async {
    try {
      final useCase = ref.watch(catcherStringsGetUseCaseProvider);
      return language.when(
        data: (value) => CatcherStringsState(entity: AsyncValue.data(useCase.call(language: value))),
        error: (e, stack) => CatcherStringsState(entity: AsyncValue.error(e, stack)),
        loading: () => const CatcherStringsState(),
      );
    } catch (e, stack) {
      return CatcherStringsState(entity: AsyncValue.error(e, stack));
    }
  }
}