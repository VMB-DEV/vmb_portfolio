import 'package:flutter/material.dart';
import 'package:vmb_portfolio/core/presentation/background/widget_background.dart';
import 'package:vmb_portfolio/core/utils/contruction.dart';

class LoadingScreen extends StatefulWidget {
  const LoadingScreen({super.key});

  @override
  State<LoadingScreen> createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> with SingleTickerProviderStateMixin {
  final duration = Duration(milliseconds: 1500);
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: duration,
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: AppBackground(child: ToConstruct(str: "SOME LOADING SCREEN"),
      ),
    );
  }
}