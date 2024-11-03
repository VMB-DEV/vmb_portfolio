import 'package:flutter/material.dart';
import 'package:vmb_portfolio/features/projects/presentation/page/sizes_projects.dart';
import 'package:vmb_portfolio/features/projects/presentation/page/widget_project.dart';

import '../../Project.dart';

class ProjectPart extends StatelessWidget {
  final ProjectsSizes sizes;
  const ProjectPart({super.key, required this.sizes});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (ctx, box) {
        // final projectBox = BoxConstraints.tightFor(width: box.W, height: box.H * 0.2);
        // final projectBox = BoxConstraints.tightFor(width: box.W, height: 300);
        return Column(
          children: Project.values.map((project)
          => ProjectWidget(type: project, sizes: sizes,)).toList(),
        );
      }
    );
  }
}
