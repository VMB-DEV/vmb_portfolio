import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:vmb_portfolio/core/extensions/map.dart';
import 'package:vmb_portfolio/features/projects/presentation/page/sizes_projects.dart';
import 'package:vmb_portfolio/features/projects/presentation/page/widget_project.dart';
import 'package:vmb_portfolio/features/projects/presentation/state_management/provider_project_entities.dart';

import '../../../../core/constants/custom_colors.dart';
import '../../../../core/data/values/languages.dart';
import '../../../../core/state_management/riverpod/language/provider_language.dart';
import '../../Project.dart';

class ProjectPart extends ConsumerStatefulWidget {
  final ProjectsSizes sizes;
  const ProjectPart({super.key, required this.sizes});

  @override
  ConsumerState<ProjectPart> createState() => _ProjectPartState();
}

class _ProjectPartState extends ConsumerState<ProjectPart> with SingleTickerProviderStateMixin {
  final duration = const Duration(milliseconds: 500);
  late AnimationController _controller;
  late Animation<double> _animationValue;
  late Languages _currentLanguage;
  Languages? _previousLanguage;
  Languages get language => ref.watch(languageProvider).requireValue.language.requireValue;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: duration,
      value: 0,
      vsync: this,
    );

    _animationValue = Tween<double>(
      begin: 0,
      end: 1,
    ).animate(_controller);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (ctx, box) {
        if (_previousLanguage != null && _previousLanguage != language) {
          _controller.reverse().whenComplete(() {
            _controller.forward();
            setState(() => _currentLanguage = language);
          });
        } else if (_previousLanguage == null) {
          _currentLanguage = language;
          _controller.forward(from: 0);
        }
        _previousLanguage = language;
        return ref.watch(projectEntitiesNotifierProvider).when(
          data: (data) => Column(
            children: Project.values.mapIndexed((index, project)
            => ProjectWidget(
              entity: data.projects.value![index],
              sizes: widget.sizes,
              animationValue: _animationValue,
              controller: _controller,
            )).toList(),
          ),
          error: (_,__) => const Icon(Icons.error, color: MyColors.error,),
          loading: () => const CircularProgressIndicator(),
        );
      },
    );
  }
}

// class ProjectPart extends ConsumerWidget {
//   final ProjectsSizes sizes;
//   const ProjectPart({super.key, required this.sizes});
//
//   @override
//   Widget build(BuildContext context, WidgetRef ref) {
//     return LayoutBuilder(
//       builder: (ctx, box) {
//         return ref.watch(projectEntitiesNotifierProvider).when(
//           data: (data) => Column(
//           children: Project.values.mapIndexed((index, project)
//           => ProjectWidget(entity: data.projects.value![index], sizes: sizes,)).toList(),
//         ),
//           error: (_,__) => const Icon(Icons.error, color: MyColors.error,),
//           loading: () => const CircularProgressIndicator(),
//         );
//       }
//     );
//   }
// }