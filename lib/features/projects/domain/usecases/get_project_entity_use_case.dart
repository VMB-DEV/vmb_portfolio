import 'package:vmb_portfolio/features/projects/domain/entity/entity_project.dart';
import 'package:vmb_portfolio/features/projects/domain/repository/projects_repository.dart';

import '../../Project.dart';

class GetProjectEntityUseCase {
  final ProjectsRepository projectRepo;

  GetProjectEntityUseCase({required this.projectRepo});

  Future<ProjectEntity> call(Project type) async => ProjectEntity.from(model: await projectRepo.getProjectModel(type));
}