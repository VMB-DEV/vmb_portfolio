import 'dart:ui' as ui;
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:vmb_portfolio/features/catcher/presentation/page/sizes_catcher.dart';
import 'package:vmb_portfolio/features/catcher/presentation/page/widget/fun/painter_sliding_icon.dart';
import 'package:vmb_portfolio/features/catcher/presentation/state_management/comicPic/provider_catcher_comic_pic.dart';
import 'package:vmb_portfolio/features/catcher/presentation/state_management/icons/provider_catcher_icons.dart';

import '../../../../../../core/constants/custom_colors.dart';
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
  final Duration animationSlideDuration = const Duration(milliseconds: 500);
  // final Duration animationSlideDuration = const Duration(milliseconds: 1500);
  late AnimationController _controllerSlide;
  late Animation<double> _iconAnimatedMovement;
  late Animation<double> _iconAnimatedAppearance;
  late Animation<double> _iconAnimatedDisappearance;
  late List<ui.Image> list;
  int _index = 0;
  final maxCycles = 2;

  CatcherSizes get sizes => widget.sizes;

  @override
  void initState() {
    super.initState();
    Log.red('_AnimatedCatcherRightPartWidgetState.initState - screen ${widget.sizes.screen}');
    _controllerSlide = AnimationController(
      duration: animationSlideDuration,
      value: 0,
      vsync: this,
    )
      ..forward()
      ..addListener( _handleAnimationStatus );

    _iconAnimatedAppearance = Tween<double>( begin: 0.0, end: 1.0, ).animate(
      CurvedAnimation(
        parent: _controllerSlide,
        curve: const Interval( 0.0, 0.25, curve: Curves.linear, ),
      ),
    );
    _iconAnimatedMovement = Tween<double>( begin: 0.0, end: 1.0, ).animate(
      CurvedAnimation(
        parent: _controllerSlide,
        curve: const Interval( 0.0, 1.0, curve: Cubic(0.21, 0.79, 0.7, 0.32), ),
        // curve: const Interval( 0.0, 1.0, curve: Curves.linear, ),
      ),
    );
    _iconAnimatedDisappearance = Tween<double>( begin: 0.0, end: 1.0, ).animate(
      CurvedAnimation(
        parent: _controllerSlide,
        curve: const Interval( 0.75, 1.0, curve: Curves.linear, ),
      ),
    );
  }

  void _handleAnimationStatus() {
    if (_controllerSlide.isCompleted) {
      setState(() {
        _index == list.length - 1 ? _index = 0 : _index++;
      });
      _controllerSlide.reset();
      _controllerSlide.forward();
    }
  }

  @override
  void dispose() {
    _controllerSlide.dispose();
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
      return sizes.isCompact ? _compactLayout : _largeLayout;
    } else {
      return Container();
    }
  }

  Widget get _compactLayout => Stack(
    children: [
      Align(
        alignment: Alignment.centerRight,
        child: SizedBox(
          height: 10,
          width: 10,
          child: coolIcon(list[_index]),
        ),
      ),
      Align(
        alignment: Alignment.centerLeft,
        child: _mySelf,
      ),
    ],
  );
  
  Widget get _largeLayout => Stack(
    children: [
      SizedBox(
        height: 10,
        width: 10,
        child: coolIcon(list[_index]),
      ),
      Align(
        alignment: Alignment.center,
        child: _mySelf,
      ),
    ],
  );

  Widget get _mySelf =>
      ref.watch(catcherComicPicProvider).when(
    data: (state) => state.comicPic.when(
      data: (pic) => RawImage( image: pic, ),
      error: (Object error, StackTrace stackTrace) => Text(stackTrace.toString(), style: TextStyle(color: Colors.white),),
      loading: () => const CircularProgressIndicator(),
    ),
    error: (Object error, StackTrace stackTrace) => const Icon(Icons.error, color: MyColors.error,),
    loading: () => const CircularProgressIndicator(),
  );

  Widget coolIcon(ui.Image icon) => CustomPaint(
    painter: SlidingIconPainter(
      sizes: widget.sizes,
      animationMovement: _iconAnimatedMovement,
      animationAppearance: _iconAnimatedAppearance,
      animationDisappearance: _iconAnimatedDisappearance,
      icon: icon,
      repaint: _controllerSlide,
    ),
    child: const SizedBox(width: 100, height: 100,),
  );
}
