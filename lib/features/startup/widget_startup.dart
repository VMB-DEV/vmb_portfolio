import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:vmb_portfolio/features/startup/screen_error.dart';
import 'package:vmb_portfolio/features/startup/screen_loading.dart';

import '../../core/presentation/background/widget_background.dart';
import '../../core/state_management/riverpod/startup/provider_startup.dart';
import '../../core/state_management/riverpod/startup/state_startup.dart';
import '../../main.dart';

class AppStartUp extends ConsumerWidget {
  const AppStartUp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final startupState = ref.watch(startupProvider);

    return MaterialApp(
      navigatorKey: navigatorKey,
      debugShowMaterialGrid: false,
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: AppBackground(
          child: switch (startupState) {
            StartupLoading() => const LoadingScreen(),
            StartupComplete() => const Portfolio(),
            StartupError() => ErrorScreen(
              error: startupState.error,
            ),
          },
        ),
      ),
    );
  }
}
