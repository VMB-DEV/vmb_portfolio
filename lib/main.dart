import 'package:flutter/material.dart';
import 'package:vmb_portfolio/core/constants/custom_colors.dart';
import 'package:vmb_portfolio/core/extensions/box_constraints.dart';
import 'package:vmb_portfolio/core/presentation/background/widget_background.dart';
import 'package:vmb_portfolio/features/catcher/page/catcher_part.dart';

import 'features/header/page/widget_header.dart';

void main() {
  runApp(const Portfolio());
}

class Portfolio extends StatelessWidget {
  const Portfolio({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowMaterialGrid: false,
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: AppBackground(
          child: LayoutBuilder(
            builder: (ctx, screen) {
              final headerBox = BoxConstraints.tightFor(
                height: screen.H * 0.07,
                width: screen.W,
              );
              final catcherBox = BoxConstraints.tightFor(
                height: screen.H * 0.7,
                width: screen.W,
              );
              return Column(
                children: [
                  HeaderWidget(box: headerBox),
                  CatcherPart(box: catcherBox),
                ]
              );
            }
          ),
        ),
      ),
    );
  }
}
