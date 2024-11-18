import 'dart:ui';

import 'package:vmb_portfolio/core/data/values/url_type.dart';
import '../../../../core/data/values/languages.dart';
import '../../Project.dart';

class ProjectModel {
  final Project type;
  final Map<Languages, String> concept;
  final Map<Languages, String> description;
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