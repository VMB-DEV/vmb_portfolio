import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:vmb_portfolio/core/data/data_source/local_data_source_language.dart';
import 'package:vmb_portfolio/core/data/repository/language_repository.dart';
import 'package:vmb_portfolio/core/state_management/riverpod/language/notifier_language.dart';
import 'package:vmb_portfolio/core/state_management/riverpod/language/state_language.dart';

final sharedPrefProvider = FutureProvider<SharedPreferences>((_) async {
  return await SharedPreferences.getInstance();
});

final languageLocalDataSourceProvider = FutureProvider<LanguageLocalDataSource>((ref) async {
  final sharedPref = await ref.watch(sharedPrefProvider.future);
  return LanguageLocalDataSourceImpl(sharedPreferences: sharedPref);
});

final languageRepoProvider = FutureProvider<LanguageRepository>((ref) async {
  final localDataSource = await ref.watch(languageLocalDataSourceProvider.future);
  return LanguageRepository(localDataSource: localDataSource);
});

final languageProvider = AsyncNotifierProvider<LanguageNotifier, LanguageState>(() {
  return LanguageNotifier();
});
