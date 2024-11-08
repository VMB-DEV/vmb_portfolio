import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:vmb_portfolio/core/extensions/map.dart';
import 'package:vmb_portfolio/features/projects/presentation/page/sizes_projects.dart';
import 'package:vmb_portfolio/features/projects/presentation/page/widget_project.dart';
import 'package:vmb_portfolio/features/projects/presentation/state_management/provider_project_entities.dart';

import '../../../../core/constants/custom_colors.dart';
import '../../Project.dart';

class ProjectPart extends ConsumerWidget {
  final ProjectsSizes sizes;
  const ProjectPart({super.key, required this.sizes});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return LayoutBuilder(
      builder: (ctx, box) {
        return ref.watch(projectEntitiesNotifierProvider).when(
          data: (data) => Column(
          children: Project.values.mapIndexed((index, project)
          => ProjectWidget(entity: data.projects.value![index], sizes: sizes,)).toList(),
        ),
          error: (_,__) => const Icon(Icons.error, color: MyColors.error,),
          loading: () => const CircularProgressIndicator(),
        );
        // return Column(
        //   children: Project.values.map((project)
        //   => ProjectWidget(type: project, sizes: sizes,)).toList(),
        // );
      }
    );
  }
}
