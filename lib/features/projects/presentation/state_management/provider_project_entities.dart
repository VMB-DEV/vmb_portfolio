import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:vmb_portfolio/core/state_management/riverpod/pictures/provider_pictures.dart';
import 'package:vmb_portfolio/features/projects/data/data_source/local_data_source_projects.dart';
import 'package:vmb_portfolio/features/projects/domain/repository/projects_repository.dart';
import 'package:vmb_portfolio/features/projects/domain/usecases/get_project_entity_use_case.dart';
import 'package:vmb_portfolio/features/projects/presentation/state_management/notifier_project_entities.dart';
import 'package:vmb_portfolio/features/projects/presentation/state_management/state_project_entities.dart';

import '../../data/repository/projects_repository_impl.dart';

final projectLocalDataSourceProvider = Provider<ProjectsLocalDataSource>((ref) {
  return ProjectsLocalDataSourceImpl();
});

final projectRepositoryProvider = Provider<ProjectsRepository>((ref) {

  final pictureLocalDataSource = ref.watch(pictureLocalDataSourceProvider);
  final projectLocalDataSource = ref.watch(projectLocalDataSourceProvider);

  return ProjectsRepositoryImpl(
    pictureLocalDataSource: pictureLocalDataSource,
    projectLocalDataSource: projectLocalDataSource,
  );
});

final projectGetEntityUseCaseProvider = Provider<GetProjectEntityUseCase>((ref) {
  final repository = ref.watch(projectRepositoryProvider);
  return GetProjectEntityUseCase(projectRepo: repository) ;
});

final projectEntitiesNotifierProvider = AsyncNotifierProvider<ProjectEntitiesNotifier, ProjectEntitiesState>(() {
  return ProjectEntitiesNotifier();
});
