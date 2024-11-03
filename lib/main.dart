import 'package:flutter/material.dart';
import 'package:vmb_portfolio/core/extensions/box_constraints.dart';
import 'package:vmb_portfolio/core/presentation/background/widget_background.dart';
import 'package:vmb_portfolio/core/presentation/sizes/sizes.dart';
import 'package:vmb_portfolio/core/presentation/titles/widget_title.dart';
import 'package:vmb_portfolio/features/catcher/page/part_catcher.dart';
import 'package:vmb_portfolio/features/projects/presentation/page/project_part.dart';
import 'features/header/page/widget_header.dart';

void main() {
  runApp(const Portfolio());
}

class Portfolio extends StatefulWidget {
  const Portfolio({super.key});

  @override
  State<Portfolio> createState() => _PortfolioState();
}

class _PortfolioState extends State<Portfolio> {
  final scrollController = ScrollController();
  final List<GlobalKey> navBarKeys = List.generate(4, (_) => GlobalKey());

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowMaterialGrid: false,
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: AppBackground(
          child: LayoutBuilder(
            builder: (ctx, screen) {
              final allSizes = AllSizes(screen: screen);
              return Column(
                children: [
                  HeaderWidget(sizes: allSizes.header,),
                  Container(
                    constraints: allSizes.scrollViewBox,
                    child: SingleChildScrollView(
                      controller: scrollController,
                      scrollDirection: Axis.vertical,
                      child: Column(
                        children: [
                          CatcherPart(sizes: allSizes.catcher, navBarKey: navBarKeys[0],),
                          TitleWidget("My Projects", allSizes.titles, navBarKey: navBarKeys[1]),
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
              );
            }
          ),
        ),
      ),
    );
  }
  void scrollToSection(int navIndex) {
    final key = navBarKeys[navIndex];
    Scrollable.ensureVisible(
      key.currentContext!,
      duration: const Duration(milliseconds: 500),
      curve: Curves.easeInOut,
    );
  }
}
