import 'package:flutter/material.dart';
import 'package:vmb_portfolio/core/utils/contruction.dart';

class LoadingScreen extends StatelessWidget {
  const LoadingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: const ToConstruct(str: "SOME LOADING SCREEN"));
    // CircularProgressIndicator();
  }
}
