import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:vmb_portfolio/features/catcher/presentation/state_management/comicPic/provider_catcher_comic_pic.dart';
import 'package:vmb_portfolio/features/catcher/presentation/state_management/icons/provider_catcher_icons.dart';
import 'package:vmb_portfolio/features/catcher/presentation/state_management/text_icon_link/provider_catcher_url.dart';
import 'package:vmb_portfolio/features/contact/presentation/state_management/provider_contact_links.dart';
import 'package:vmb_portfolio/features/projects/presentation/state_management/provider_project_entities.dart';
import 'package:vmb_portfolio/features/startup/presentation/screen_loading.dart';

import '../../../core/presentation/background/widget_background.dart';
import '../../../core/state_management/riverpod/language/provider_language.dart';
import '../../../core/utils/logs.dart';
import '../../../main.dart';
import '../../catcher/presentation/state_management/strings/provider_catcher_strings.dart';

class StartUp extends ConsumerStatefulWidget {
  const StartUp({super.key});

  @override
  ConsumerState<StartUp> createState() => _StartupState();
}

class _StartupState extends ConsumerState<StartUp> {
  bool appLoaded = false;

  @override
  Widget build(BuildContext context) {
    if (appLoaded) { return app; }
    final states = getProviders.map(ref.watch).toList();
    checkStateErrors(states);
    checkStateLoaded(states);
    return const LoadingScreen();
  }

  Widget get app => MaterialApp(
    navigatorKey: navigatorKey,
    debugShowMaterialGrid: false,
    debugShowCheckedModeBanner: false,
    home: const Scaffold(
      body: AppBackground(
        child: Portfolio(),
      ),
    ),
  );

  void checkStateLoaded(List<AsyncValue<Object?>> states) {
    if (states.every((state) => state is AsyncData)) {
      Log.blue('_StartupState.build - app loaded');
      Future(() => setState(() => appLoaded = true));
    }
  }

  void checkStateErrors(List<AsyncValue<Object?>> states) {
    if (states.every((state) => state is AsyncData)) {
      Log.blue('_StartupState.build - app loaded');
      Future(() => setState(() => appLoaded = true));
    }
  }

  List<ProviderListenable<AsyncValue<Object?>>> get getProviders => <ProviderListenable<AsyncValue<Object?>>>[
    languageProvider,
    catcherStringsNotifierProvider,
    catcherIconsProvider,
    catcherIconTextLinkProvider,
    catcherComicPicProvider,
    contactLinkProvider,
    projectEntitiesNotifierProvider,
  ];
}