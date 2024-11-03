import 'package:flutter/material.dart';
import '../../Project.dart';

class ProjectModel {
  final Project type;
  final String concept;
  final String description;
  final String techno;
  final List<Image> images;

  const ProjectModel({
    required this.type,
    required this.concept,
    required this.description,
    required this.techno,
    required this.images,
  });
}