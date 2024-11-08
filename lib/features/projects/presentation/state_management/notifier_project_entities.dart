import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:vmb_portfolio/features/projects/presentation/state_management/provider_project_entities.dart';
import 'package:vmb_portfolio/features/projects/presentation/state_management/state_project_entities.dart';

import '../../Project.dart';

class ProjectEntitiesNotifier extends AsyncNotifier<ProjectEntitiesState> {
  @override
  Future<ProjectEntitiesState> build() async {
    return _loadAllIcons();
  }

  Future<ProjectEntitiesState> _loadAllIcons() async {
    final useCase = ref.watch(projectGetEntityUseCaseProvider);

    try {
      final results = await Future.wait(
        Project.values.map((project) => useCase.call(project)),
      );

      return ProjectEntitiesState(
        projects: AsyncValue.data(results),
      );
    } catch (e, stack) {
      return ProjectEntitiesState(
        projects: AsyncValue.error(e, stack),
      );
    }
  }
}
