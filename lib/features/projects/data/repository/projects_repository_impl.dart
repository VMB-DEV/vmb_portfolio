import 'package:vmb_portfolio/core/data/data_source/local_data_source_picture.dart';
import 'package:vmb_portfolio/features/projects/data/model/model_project.dart';
import 'package:vmb_portfolio/features/projects/domain/repository/projects_repository.dart';
import '../../Project.dart';
import '../data_source/local_data_source_projects.dart';
import '../values/data_project.dart';

class ProjectsRepositoryImpl implements ProjectsRepository {
  final ProjectsLocalDataSource projectLocalDataSource;
  final PictureLocalDataSource pictureLocalDataSource;

  ProjectsRepositoryImpl({
    required this.projectLocalDataSource,
    required this.pictureLocalDataSource,
  });

  @override
  Future<ProjectModel> getProjectModel(Project project){
    return _projectFromType(project);
  }

  Future<ProjectModel> _projectFromType(Project type) async {
    return ProjectModel(
      type: type,
      concept: projectLocalDataSource.getConcept(type),
      description: projectLocalDataSource.getDescription(type),
      techno: projectLocalDataSource.getTechno(type),
      icon: await switch (type) {
        Project.portfolio => pictureLocalDataSource.getPicture(ProjectData.portfolio.icon.path),
        Project.robuzzle => pictureLocalDataSource.getPicture(ProjectData.robuzzle.icon.path),
        Project.snake => pictureLocalDataSource.getPicture(ProjectData.snake.icon.path),
        Project.spacewars => pictureLocalDataSource.getPicture(ProjectData.spacewars.icon.path),
      },
      images: await switch (type) {
        Project.portfolio => pictureLocalDataSource.getPictures(ProjectData.portfolio.assets.map((type) => type.path).toList()),
        Project.robuzzle => pictureLocalDataSource.getPictures(ProjectData.robuzzle.assets.map((type) => type.path).toList()),
        Project.snake => pictureLocalDataSource.getPictures(ProjectData.snake.assets.map((type) => type.path).toList()),
        Project.spacewars => pictureLocalDataSource.getPictures(ProjectData.spacewars.assets.map((type) => type.path).toList()),
      }
    );
  }
}