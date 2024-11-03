import 'package:vmb_portfolio/features/projects/data/model/model_project.dart';

import '../../Project.dart';

abstract class ProjectsRepository {
  ProjectModel getProjectModel(Project project);
}