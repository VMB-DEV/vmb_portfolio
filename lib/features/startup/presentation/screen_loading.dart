import 'package:flutter/material.dart';
import 'package:vmb_portfolio/core/presentation/background/widget_background.dart';
import 'package:vmb_portfolio/core/utils/contruction.dart';

class LoadingScreen extends StatelessWidget {
  const LoadingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: AppBackground(child: const ToConstruct(str: "SOME LOADING SCREEN")));
    // CircularProgressIndicator();
  }
}
