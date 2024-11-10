import 'dart:ui';

import 'package:vmb_portfolio/core/data/values/url_type.dart';
import '../../Project.dart';

class ProjectModel {
  final Project type;
  final String concept;
  final String description;
  final String techno;
  final Image icon;
  final List<(Image, UrlType)> links;
  final List<Image> images;

  const ProjectModel({
    required this.type,
    required this.concept,
    required this.description,
    required this.techno,
    required this.icon,
    required this.links,
    required this.images,
  });
}