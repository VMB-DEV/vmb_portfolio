import 'package:get_it/get_it.dart';
import 'package:vmb_portfolio/core/data/data_source/local_data_source_picture.dart';
import 'package:vmb_portfolio/core/data/repository/picture_repository.dart';
import 'package:vmb_portfolio/features/catcher/domain/repository/catcher_icons_repository.dart';
import 'package:vmb_portfolio/features/catcher/domain/usecase/use_case_get_catcher_icon.dart';
import 'package:vmb_portfolio/features/projects/data/data_source/local_data_source_projects.dart';
import 'package:vmb_portfolio/features/projects/data/repository/projects_repository_impl.dart';
import 'package:vmb_portfolio/features/projects/domain/repository/projects_repository.dart';
import 'package:vmb_portfolio/features/projects/domain/usecases/get_project_entity_use_case.dart';

final GetIt getIt = GetIt.instance;

Future<void> init() async {
  /// registering access to Local data
  getIt.registerLazySingleton<PictureLocalDataSource>(()
  => PictureLocalDataSourceImpl());
  getIt.registerLazySingleton<ProjectsLocalDataSource>(()
  => ProjectsLocalDataSourceImpl());

  /// registering repo to manipulate data
  getIt.registerLazySingleton<CatcherIconsRepository>(()
  => PictureRepository(pictureLocalDataSource: getIt()));
  getIt.registerLazySingleton<ProjectsRepository>(()
  => ProjectsRepositoryImpl(projectLocalDataSource: getIt(), pictureLocalDataSource: getIt()));
  // getIt.registerLazySingleton<CatcherIconsRepository>(()
  // => CatcherIconsRepository());

  /// registering usecases
  getIt.registerLazySingleton<GetCatcherIconsUseCase>(()
  => GetCatcherIconsUseCase(catcherIconsRepository: getIt()));
  getIt.registerLazySingleton<GetProjectEntityUseCase>(()
  => GetProjectEntityUseCase(projectRepo: getIt()));
}