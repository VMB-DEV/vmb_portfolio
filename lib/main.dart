import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:vmb_portfolio/core/presentation/sizes/sizes.dart';
import 'package:vmb_portfolio/core/presentation/titles/widget_title.dart';
import 'core/state_management/riverpod/scroll/provider_scroll.dart';
import 'features/catcher/presentation/page/part_catcher.dart';
import 'features/contact/presentation/page/contact_part.dart';
import 'features/header/presentation/page/widget_header.dart';
import 'features/projects/presentation/page/project_part.dart';
import 'features/startup/presentation/widget_startup.dart';

final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SharedPreferences.setMockInitialValues({});
  runApp(const ProviderScope(child: StartUp(),));
}

class Portfolio extends ConsumerWidget {
  const Portfolio({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return LayoutBuilder(
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
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CatcherPart(sizes: allSizes.catcher, navBarKey: ref.watch(scrollRiverpod).navBarKeys[0],),
                        TitleWidget("My Projects", allSizes.titles, navBarKey: ref.watch(scrollRiverpod).navBarKeys[1]),
                        ProjectPart(sizes: allSizes.projects),
                        TitleWidget("My Contacts", allSizes.titles, navBarKey: ref.watch(scrollRiverpod).navBarKeys[2]),
                        ContactPart(sizes: allSizes),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            HeaderWidget(sizes: allSizes.header,),
          ],
        );
      },
    );
  }
}