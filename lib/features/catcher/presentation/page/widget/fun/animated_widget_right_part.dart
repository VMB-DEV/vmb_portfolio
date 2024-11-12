import 'dart:ui' as ui;
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:vmb_portfolio/features/catcher/presentation/page/sizes_catcher.dart';
import 'package:vmb_portfolio/features/catcher/presentation/page/widget/fun/painter_sliding_icon.dart';
import 'package:vmb_portfolio/features/catcher/presentation/state_management/icons/provider_catcher_icons.dart';

import '../../../../../../core/utils/logs.dart';

class AnimatedCatcherRightPartWidget extends ConsumerStatefulWidget {
  final CatcherSizes sizes;
  const AnimatedCatcherRightPartWidget({
    required this.sizes,
    super.key,
  });

  @override
  ConsumerState<AnimatedCatcherRightPartWidget> createState() => _AnimatedCatcherRightPartWidgetState();
}

class _AnimatedCatcherRightPartWidgetState extends ConsumerState<AnimatedCatcherRightPartWidget> with SingleTickerProviderStateMixin {
  final Duration animationDuration = const Duration(milliseconds: 500);
  late AnimationController _controller;
  late Animation<double> _iconAnimatedMovement;
  late Animation<double> _iconAnimatedAppearance;
  late Animation<double> _iconAnimatedDisappearance;
  late List<ui.Image> list;
  int _index = 0;
  final maxCycles = 2;


  @override
  void initState() {
    super.initState();
    Log.red('_AnimatedCatcherRightPartWidgetState.initState - screen ${widget.sizes.screen}');
    _controller = AnimationController(
      duration: animationDuration,
      value: 0,
      vsync: this,
    )
      ..forward()
      ..addListener( _handleAnimationStatus );

    _iconAnimatedAppearance = Tween<double>( begin: 0.0, end: 1.0, ).animate(
      CurvedAnimation(
        parent: _controller,
        curve: const Interval( 0.0, 0.25, curve: Curves.linear, ),
      ),
    );
    _iconAnimatedMovement = Tween<double>( begin: 0.0, end: 1.0, ).animate(
      CurvedAnimation(
        parent: _controller,
        // curve: const Interval( 0.0, 1.0, curve: Curves.slowMiddle, ),
        // curve: const Interval( 0.0, 1.0, curve: Curves.fastIn, ),
        curve: const Interval( 0.0, 1.0, curve: Cubic(0.21, 0.79, 0.7, 0.32), ),
      ),
    );
    _iconAnimatedDisappearance = Tween<double>( begin: 0.0, end: 1.0, ).animate(
      CurvedAnimation(
        parent: _controller,
        curve: const Interval( 0.75, 1.0, curve: Curves.linear, ),
      ),
    );
  }

  void _handleAnimationStatus() {
    if (_controller.isCompleted) {
      setState(() {
        _index == list.length - 1 ? _index = 0 : _index++;
      });
      _controller.reset();
      _controller.forward();
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    list = ref.watch(catcherIconsProvider).when(
        data: (state) => state.backgroundIcons.when(
          data: (list) => list,
          error: (Object error, StackTrace stackTrace) => [],
          loading: () => [],
        ),
        error: (Object error, StackTrace stackTrace) => [],
        loading: () => []
    );
    if (list.isNotEmpty) {
      return Container(
        alignment: Alignment.center,
        height: 100,
        width: 100,
        child: coolIcon(list[_index]),
      );
    } else {
      return Container();
    }
  }

  Widget coolIcon(ui.Image icon) => CustomPaint(
    painter: SlidingIconPainter(
      sizes: widget.sizes,
      animationMovement: _iconAnimatedMovement,
      animationAppearance: _iconAnimatedAppearance,
      animationDisappearance: _iconAnimatedDisappearance,
      icon: icon, repaint: _controller,
    ),
    child: const SizedBox(width: 100, height: 100,),
  );
}
