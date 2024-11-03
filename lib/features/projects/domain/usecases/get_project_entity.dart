import 'package:vmb_portfolio/features/projects/domain/entity/entity_project.dart';
import 'package:vmb_portfolio/features/projects/domain/repository/projects_repository.dart';

import '../../Project.dart';

class GetProjectEntity {
  final ProjectsRepository projectRepo;

  GetProjectEntity({required this.projectRepo});

  ProjectEntity call(Project type) => ProjectEntity.from(model: projectRepo.getProjectModel(type));
}