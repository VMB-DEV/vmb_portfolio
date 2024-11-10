import 'dart:ui';

import '../../../catcher/domain/entity/entity_icon_text_link.dart';
import '../../Project.dart';
import '../../data/model/model_project.dart';

class ProjectEntity {
  final Project type;
  final String concept;
  final String description;
  final String techno;
  final Image icon;
  final List<IconTextLinkEntity> links;
  final List<Image> images;

  const ProjectEntity({
    required this.type,
    required this.concept,
    required this.description,
    required this.techno,
    required this.icon,
    required this.links,
    required this.images,
  });

  factory ProjectEntity.from({required ProjectModel model}) => ProjectEntity(
    type: model.type,
    concept: model.concept,
    description: model.description,
    techno: model.techno,
    icon: model.icon,
    links: model.links.map((pair) => IconTextLinkEntity(text: pair.$2.text, urlString: pair.$2.urlString, icon: pair.$1)).toList(),
    images: model.images,
  );
}