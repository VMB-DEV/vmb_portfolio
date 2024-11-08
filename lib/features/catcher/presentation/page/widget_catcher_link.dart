import 'dart:ui' as ui;

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:vmb_portfolio/features/catcher/presentation/page/sizes_catcher.dart';

import '../../../../core/constants/custom_colors.dart';
import '../../../../core/presentation/pictures/painter_animated_shadow_picture.dart';
import '../../../../core/utils/logs.dart';
import '../../../../core/presentation/text/painter_animated_underline.dart';
import '../../domain/entity/entity_icon_text_link.dart';

class CatcherLinkAnimatedWidget extends ConsumerStatefulWidget {
  final CatcherSizes sizes;
  final IconTextLinkEntity entity;
  const CatcherLinkAnimatedWidget({
    required this.sizes,
    required this.entity,
    super.key,
  });

  @override
  ConsumerState<CatcherLinkAnimatedWidget> createState() => _CatcherLinkAnimatedWidgetState();
}

class _CatcherLinkAnimatedWidgetState extends ConsumerState<CatcherLinkAnimatedWidget> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _iconAnimation;
  late Animation<double> _textAnimation;
  final duration = const Duration(milliseconds: 300);
  bool onHover = false;
  CatcherSizes get sizes => widget.sizes;

  @override
  void initState() {
    super.initState();
    super.initState();
    _controller = AnimationController(
      duration: duration,
      value: 0,
      vsync: this,
    );

    _iconAnimation = Tween<double>( begin: 0.0, end: 1.0, ).animate(
      CurvedAnimation(
        parent: _controller,
        curve: const Interval( 0.0, 0.5, curve: Curves.easeIn, ),
      ),
    );
    _textAnimation = Tween<double>( begin: 0.0, end: 1.0, ).animate(
      CurvedAnimation(
        parent: _controller,
        curve: const Interval( 0.1, 1, curve: Curves.easeInOut, ),
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: sizes.mediumMargins.start,
      child: MouseRegion(
        hitTestBehavior: HitTestBehavior.translucent,
        onEnter: (_) => setHover(true),
        onExit: (_) => setHover(false),
        child: urlLauncher(
          child: iconAndText,
        )
      ),
    );
  }

  Widget urlLauncher({required child}) {
    return InkWell(
      onTap: () => launchUrl(Uri.parse(widget.entity.urlString)),
      child: child,
    );
  }
  Widget get iconAndText => Row( children: [
    icon( icon: widget.entity.icon, animationPercent: _iconAnimation, ),
    text,
  ],);

  Widget get text => Container(
    margin: sizes.smallMargins.start,
    child: CustomPaint(
      painter: AnimatedUnderlinePainter(
        text: widget.entity.text,
        animation: _textAnimation,
        fontSize: sizes.fonts.small,
        repaint: _controller,
      ),
      child: Text(
        widget.entity.text,
        style: TextStyle(
          color: MyColors.visibleText,
          fontSize: sizes.fonts.small,
          shadows: onHover ? [
            const Shadow(
              offset: Offset(-0.5, -0.5),
              blurRadius: 2,
              color: MyColors.textTopShadow,
            ),
            const Shadow(
              offset: Offset(1.2, 1.2),
              blurRadius: 2,
              color: MyColors.textBotShadow,
            ),
          ] : [],
        ),
      ),
    ),
  );

  Widget icon({
    required ui.Image icon,
    required Animation<double> animationPercent,
  }) => CustomPaint(
    painter: AnimatedShadowPicture(
      image: icon,
      animationPercent: animationPercent,
      repaint: _controller,
      blur: 3.5,
    ),
    child: SizedBox(height: 30, width: 30,)
  );

  void setHover(bool state) {
    Log.red('_CatcherLinkAnimatedWidgetState.setHover - $state');
    setState(() => onHover = state);
    if (state) {
      _controller.forward();
    } else {
      _controller.reverse();
    }
  }
}
