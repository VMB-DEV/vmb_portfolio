import 'package:vmb_portfolio/features/projects/data/model/model_project.dart';
import 'package:vmb_portfolio/features/projects/domain/repository/projects_repository.dart';
import '../../Project.dart';
import '../data_source/local_data_source_projects.dart';

class ProjectsRepositoryImpl implements ProjectsRepository {
  final ProjectsLocalDataSource localDataSource;

  ProjectsRepositoryImpl({required this.localDataSource});

  @override
  ProjectModel getProjectModel(Project project){
    return _projectFromType(project);
  }

  ProjectModel _projectFromType(Project type) => ProjectModel(
    type: type,
    concept: localDataSource.getConcept(type),
    description: localDataSource.getDescription(type),
    techno: localDataSource.getTechno(type),
    images: localDataSource.getImages(type),
  );
}