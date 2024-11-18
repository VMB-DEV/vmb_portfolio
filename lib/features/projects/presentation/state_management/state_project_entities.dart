import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:vmb_portfolio/features/projects/domain/entity/entity_project.dart';

class ProjectEntitiesState {
  final AsyncValue<List<ProjectEntity>> projects;
  bool isLoading;

  ProjectEntitiesState({
    required this.projects,
    this.isLoading = true,
  });

  ProjectEntitiesState copyWith({
    AsyncValue<List<ProjectEntity>>? projects,
    bool? isLoading,
  }) {
    return ProjectEntitiesState(
      projects: projects ?? this.projects,
      isLoading: isLoading ?? this.isLoading,
    );
  }
}
