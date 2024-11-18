import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:vmb_portfolio/features/catcher/domain/entity/entity_catcher_strings.dart';

class CatcherStringsState {
  final AsyncValue<CatcherStringsEntity> entity;

  const CatcherStringsState({this.entity = const AsyncValue.loading()});

  CatcherStringsState copyWith({
    AsyncValue<CatcherStringsEntity>? entity,
  }) {
    return CatcherStringsState(
      entity: entity ?? this.entity,
    );
  }
}