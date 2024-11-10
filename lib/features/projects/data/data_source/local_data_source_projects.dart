import 'package:flutter/material.dart';
import 'package:vmb_portfolio/core/data/values/picture_type.dart';
import 'package:vmb_portfolio/core/data/values/url_type.dart';

import '../../Project.dart';
import '../values/data_project.dart';

abstract class ProjectsLocalDataSource {
  String getConcept(Project project);
  String getDescription(Project project);
  String getTechno(Project project);
  List<(PictureType, UrlType)> getLinks(Project project);
}

class ProjectsLocalDataSourceImpl implements ProjectsLocalDataSource {
  @override
  String getConcept(Project project) => switch (project) {
    Project.portfolio => ProjectData.portfolio.concept,
    Project.robuzzle => ProjectData.robuzzle.concept,
    Project.snake => ProjectData.snake.concept,
    Project.spacewars => ProjectData.spacewars.concept,
  };

  @override
  String getDescription(Project project) => switch (project) {
    Project.portfolio => ProjectData.portfolio.description,
    Project.robuzzle => ProjectData.robuzzle.description,
    Project.snake => ProjectData.snake.description,
    Project.spacewars => ProjectData.spacewars.description,
  };

  @override
  String getTechno(Project project) => switch (project) {
    Project.portfolio => ProjectData.portfolio.techno,
    Project.robuzzle => ProjectData.robuzzle.techno,
    Project.snake => ProjectData.snake.techno,
    Project.spacewars => ProjectData.spacewars.techno,
  };

  @override
  List<(PictureType, UrlType)> getLinks(Project project) => switch (project) {
    Project.portfolio => ProjectData.portfolio.links,
    Project.robuzzle => ProjectData.robuzzle.links,
    Project.snake => ProjectData.snake.links,
    Project.spacewars => ProjectData.spacewars.links,
  };
}
