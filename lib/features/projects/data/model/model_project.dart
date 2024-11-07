import 'dart:ui';

import '../../Project.dart';

class ProjectModel {
  final Project type;
  final String concept;
  final String description;
  final String techno;
  final Image icon;
  final List<Image> images;

  const ProjectModel({
    required this.type,
    required this.concept,
    required this.description,
    required this.techno,
    required this.icon,
    required this.images,
  });
}