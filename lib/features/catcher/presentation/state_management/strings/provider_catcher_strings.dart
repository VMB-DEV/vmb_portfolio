import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:vmb_portfolio/features/catcher/data/data_source/local_data_source_catcher.dart';
import 'package:vmb_portfolio/features/catcher/data/repository/catcher_strings_repository_impl.dart';
import 'package:vmb_portfolio/features/catcher/domain/repository/catcher_strings_repository.dart';
import 'package:vmb_portfolio/features/catcher/domain/usecase/use_case_get_catcher_strings.dart';
import 'package:vmb_portfolio/features/catcher/presentation/state_management/strings/notifier_catcher_strings.dart';
import 'package:vmb_portfolio/features/catcher/presentation/state_management/strings/state_catcher_strings.dart';

final _catcherStringsLocalDataSourceProvider = Provider<CatcherLocalDataSource>((ref) {
  return CatcherLocalDataSourceImpl();
});

final _catcherStringsRepositoryProvider = Provider<CatcherStringsRepository>((ref) {
  final dataSource = ref.watch(_catcherStringsLocalDataSourceProvider);
  return CatcherStringsRepositoryImpl(dataSource: dataSource);
});

final catcherStringsGetUseCaseProvider = Provider<GetCatcherStringsUseCase>((ref) {
  final repository = ref.watch(_catcherStringsRepositoryProvider);
  return GetCatcherStringsUseCase(repository: repository);
});

final catcherStringsNotifierProvider = AsyncNotifierProvider<CatcherStringsNotifier, CatcherStringsState>(() {
  return CatcherStringsNotifier();
});