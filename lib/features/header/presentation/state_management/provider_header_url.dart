import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:vmb_portfolio/core/data/repository/url_repository.dart';
import 'package:vmb_portfolio/features/header/domain/repository/header_url_repository.dart';
import 'package:vmb_portfolio/features/header/domain/usecase/use_case_get_resume_link.dart';
import 'package:vmb_portfolio/features/header/presentation/state_management/notifier_header_url.dart';

final _headerUrlRepositoryProvider = Provider<HeaderUrlRepository>((ref) {
  return UrlRepository();
});

final _headerUseCaseProvider = Provider<GetResumeUseCase>((ref) {
  final repository = ref.watch(_headerUrlRepositoryProvider);
  return GetResumeUseCase(headerUrlRepository: repository);
});

final headerUrlNotifierProvider = Provider<HeaderUrlNotifier>((ref) {
  final useCase = ref.watch(_headerUseCaseProvider);
  return HeaderUrlNotifier(useCase: useCase);
});

// final headerUrlProvider = Provider<String>((ref) {
//   return ref.watch(provider)
// });
