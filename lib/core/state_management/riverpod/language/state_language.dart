import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../data/values/languages.dart';

class LanguageState {
  final AsyncValue<Languages> language;

  LanguageState({this.language = const AsyncValue.loading()});

  bool get isFrench => language.valueOrNull == Languages.french;

  LanguageState copyWith({
    AsyncValue<Languages>? language,
  }) {
    return LanguageState(
      language: language ?? this.language,
    );
  }
}
