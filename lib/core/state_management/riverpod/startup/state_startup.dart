import 'package:flutter_riverpod/flutter_riverpod.dart';

class StartupState {
  final AsyncValue<bool> loaded;

  const StartupState({this.loaded = const AsyncValue.loading()});

  StartupState copyWith({
    AsyncValue<bool>? loaded,
  }) {
    return StartupState(
      loaded: loaded ?? this.loaded,
    );
  }
}
