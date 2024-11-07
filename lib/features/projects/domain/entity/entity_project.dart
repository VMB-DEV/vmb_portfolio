import 'dart:ui';

import '../../Project.dart';
import '../../data/model/model_project.dart';

class ProjectEntity {
  final Project type;
  final String concept;
  final String description;
  final String techno;
  final List<Image> images;

  const ProjectEntity({
    required this.type,
    required this.concept,
    required this.description,
    required this.techno,
    required this.images,
  });

  factory ProjectEntity.from({required ProjectModel model}) => ProjectEntity(
    type: model.type,
    concept: model.concept,
    description: model.description,
    techno: model.techno,
    images: model.images,
  );
}