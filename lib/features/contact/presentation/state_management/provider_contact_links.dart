import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:vmb_portfolio/features/contact/domain/repository/repository_contact_link.dart';
import 'package:vmb_portfolio/features/contact/domain/usecase/use_case_get_contact_links.dart';
import 'package:vmb_portfolio/features/contact/presentation/state_management/notifier_contact_links.dart';
import 'package:vmb_portfolio/features/contact/presentation/state_management/state_contact_links.dart';

import '../../../../core/data/repository/picture_repository.dart';
import '../../../../core/state_management/riverpod/pictures/provider_pictures.dart';

final contactLinkRepositoryProvider = Provider<ContactLinksRepository>((ref) {
  final localDataSource = ref.read(pictureLocalDataSourceProvider);
  return PictureRepository(pictureLocalDataSource: localDataSource);
});

final contactLinkUseCaseProvider = Provider<GetContactLinksUseCase>((ref) {
  final repo = ref.watch(contactLinkRepositoryProvider);
  return GetContactLinksUseCase( repo: repo, );
});

final contactLinkProvider = AsyncNotifierProvider<ContactLinksNotifier, ContactLinksState>(() {
  return ContactLinksNotifier();
});
