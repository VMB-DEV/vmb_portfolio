import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:vmb_portfolio/core/extensions/box_constraints.dart';
import 'package:vmb_portfolio/core/presentation/background/widget_background.dart';
import 'package:vmb_portfolio/core/presentation/sizes/sizes.dart';
import 'package:vmb_portfolio/core/presentation/titles/widget_title.dart';
import 'package:vmb_portfolio/features/projects/presentation/page/project_part.dart';
import 'core/constants/custom_colors.dart';
import 'core/state_management/riverpod/scroll/provider_scroll.dart';
import 'features/catcher/presentation/page/part_catcher.dart';
import 'features/header/presentation/page/widget_header.dart';
import 'core/di/injection.dart' as di;

Future<void> main() async {
  runApp(const ProviderScope(child: Portfolio(),));
}

class Portfolio extends ConsumerWidget {
  const Portfolio({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return MaterialApp(
      debugShowMaterialGrid: false,
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: AppBackground(
          child: LayoutBuilder(
            builder: (ctx, screen) {
              final allSizes = AllSizes(screen: screen);
              return Stack(
                children: [
                  Column(
                    children: [
                      Container(constraints: allSizes.header.box,),
                      Container(
                        constraints: allSizes.scrollViewBox,
                        child: SingleChildScrollView(
                          controller: ref.watch(scrollRiverpod).scrollController,
                          scrollDirection: Axis.vertical,
                          child: Column(
                            // mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              // CatcherPart(sizes: allSizes.catcher, navBarKey: ref.watch(scrollRiverpod).navBarKeys[0],),
                              TitleWidget("My Projects", allSizes.titles, navBarKey: ref.watch(scrollRiverpod).navBarKeys[1]),
                              ProjectPart(sizes: allSizes.projects),
                              // TitleWidget("Experiences", allSizes.titles),
                              // ExperiencesPart("Experiences", allSizes.),
                              // TitleWidget("Contact Me", allSizes.titles),
                              // ContactPart("Experiences", allSizes.),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                  HeaderWidget(sizes: allSizes.header,),
                ],
              );
            }
          ),
        ),
      ),
    );
  }
}
