import 'package:flutter/material.dart';

import '../../Project.dart';
import '../values/strings_project.dart';

abstract class ProjectsLocalDataSource {
  String getConcept(Project project);
  String getDescription(Project project);
  String getTechno(Project project);
  List<Image> getImages(Project project);
}

class ProjectsLocalDataSourceImpl implements ProjectsLocalDataSource {

  @override
  List<Image> getImages(Project project) {
    List<Image> list = [];
    switch (project) {
      case Project.portfolio:
        list.addAll(_getImagesFromPath(ProjectStrings.portfolioAssetPaths));
      case Project.robuzzle:
        list.addAll(_getImagesFromPath(ProjectStrings.robuzzleAssetPaths));
      case Project.snake:
        list.addAll(_getImagesFromPath(ProjectStrings.snakeAssetPaths));
      case Project.spacewars:
        list.addAll(_getImagesFromPath(ProjectStrings.spacewarsAssetPaths));
    }
    return list;
  }

  List<Image> _getImagesFromPath(List<String> paths) {
    List<Image> list = [];
    for (final path in paths) {
      list.add(Image.asset(path));
    }
    return list;
  }

  @override
  String getConcept(Project project) => switch (project) {
    Project.portfolio => ProjectStrings.portfolioConcept,
    Project.robuzzle => ProjectStrings.robuzzleConcept,
    Project.snake => ProjectStrings.snakeConcept,
    Project.spacewars => ProjectStrings.spacewarsConcept,
  };

  @override
  String getDescription(Project project) => switch (project) {
    Project.portfolio => ProjectStrings.portfolioDescription,
    Project.robuzzle => ProjectStrings.robuzzleDescription,
    Project.snake => ProjectStrings.snakeDescription,
    Project.spacewars => ProjectStrings.spacewarsDescription,
  };

  @override
  String getTechno(Project project) => switch (project) {
    Project.portfolio => ProjectStrings.portfolioTechno,
    Project.robuzzle => ProjectStrings.robuzzleTechno,
    Project.snake => ProjectStrings.snakeTechno,
    Project.spacewars => ProjectStrings.spacewarsTechno,
  };
}
