import 'package:flutter/material.dart';
import 'package:vmb_portfolio/core/presentation/background/widget_background.dart';
import 'package:vmb_portfolio/core/utils/contruction.dart';

import '../../../core/constants/custom_colors.dart';

class LoadingScreen extends StatefulWidget {
  const LoadingScreen({super.key});

  @override
  State<LoadingScreen> createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> with SingleTickerProviderStateMixin {
  final duration = const Duration(milliseconds: 2500);
  late AnimationController _controller;
  late Animation<String> _dotsAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: duration,
    )..repeat();

    _dotsAnimation = TweenSequence<String>([
      TweenSequenceItem(weight: 1, tween: ConstantTween<String>('       ')),
      TweenSequenceItem(weight: 1, tween: ConstantTween<String>('.      ')),
      TweenSequenceItem(weight: 1, tween: ConstantTween<String>('. .    ')),
      TweenSequenceItem(weight: 1, tween: ConstantTween<String>('. . .  ')),
      TweenSequenceItem(weight: 1, tween: ConstantTween<String>('. . . .')),
    ]).animate(_controller);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowMaterialGrid: false,
      debugShowCheckedModeBanner: false,
      home: AppBackground(child:
      Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            RichText(text: const TextSpan(
              text: "VMB",
              style: TextStyle(
                fontFamily: 'Rajdhani',
                fontWeight: FontWeight.w900,
                fontSize: 140,
                color: MyColors.visibleText,
                shadows: [
                  Shadow(
                    color: MyColors.visibleText,
                    offset: Offset(1.2, 1.2),
                    blurRadius: 5.0,
                  )
                ],
              ),
            ) ),
            AnimatedBuilder(
              animation: _dotsAnimation,
              builder: (context, child) {
                return RichText(
                  text: TextSpan(
                    text: _dotsAnimation.value,
                    style: const TextStyle(
                      fontFamily: 'Rajdhani',
                      fontWeight: FontWeight.w900,
                      fontSize: 30,
                      color: MyColors.visibleText,
                    ),
                  ),
                );
              },
            )
          ],
        ),
      ), ),
    );
  }
}