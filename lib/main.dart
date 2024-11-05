import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:vmb_portfolio/core/presentation/background/widget_background.dart';
import 'package:vmb_portfolio/core/presentation/sizes/sizes.dart';
import 'package:vmb_portfolio/core/presentation/titles/widget_title.dart';
import 'package:vmb_portfolio/features/catcher/page/part_catcher.dart';
import 'package:vmb_portfolio/features/projects/presentation/page/project_part.dart';
import 'core/state_management/riverpod/provider_scroll.dart';
import 'features/header/page/widget_header.dart';

void main() {
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
                            children: [
                              CatcherPart(sizes: allSizes.catcher, navBarKey: ref.watch(scrollRiverpod).navBarKeys[0],),
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

  // void scrollToSection(int navIndex) {
  //   // Widget
  //   final key = navBarKeys[navIndex];
  //   Scrollable.ensureVisible(
  //     key.currentContext!,
  //     duration: const Duration(milliseconds: 500),
  //     curve: Curves.easeInOut,
  //   );
  // }
}
