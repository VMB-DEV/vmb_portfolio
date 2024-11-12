import 'package:flutter/material.dart';
import 'package:material_symbols_icons/material_symbols_icons.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:vmb_portfolio/core/extensions/box_constraints.dart';
import 'package:vmb_portfolio/core/extensions/list.dart';
import 'package:vmb_portfolio/core/extensions/map.dart';
import 'package:vmb_portfolio/core/presentation/text/widget_animated_text.dart';
import 'package:vmb_portfolio/features/header/domain/entity/entity_part.dart';
import 'package:vmb_portfolio/features/header/presentation/page/menu/compact/painter_compact_menu.dart';
import 'package:vmb_portfolio/features/header/presentation/page/sizes_header.dart';
import 'package:vmb_portfolio/features/header/presentation/state_management/provider_header_url.dart';
import '../../../../../../core/constants/custom_colors.dart';
import '../../../../../../core/state_management/riverpod/scroll/provider_scroll.dart';

class CompactMenuWidget extends ConsumerStatefulWidget {
  final HeaderSizes sizes;

  const CompactMenuWidget({required this.sizes, super.key});

  @override
  ConsumerState<CompactMenuWidget> createState() => _CompactMenuWidgetState();
}

class _CompactMenuWidgetState extends ConsumerState<CompactMenuWidget> with SingleTickerProviderStateMixin {
  final _menuAnimationDuration = const Duration(milliseconds: 400);
  final _textAnimationDuration = const Duration(milliseconds: 400);
  late Duration _animationDuration;
  final _menuReverseAnimationDuration = const Duration(milliseconds: 350);
  late List<Size> _stringSizes;
  late AnimationController _menuController;
  bool animationOnReverse = false;
  late Animation<double> _animation;
  late Animation<double> _heightAnimation;
  late Animation<double> _widthAnimation;
  late Animation<double> _textAnimation;
  HeaderSizes get sizes => widget.sizes;

  @override
  void initState() {
    super.initState();
    _animationDuration = _menuAnimationDuration + _textAnimationDuration;
    _stringSizes = sizes.stringSizes;
    _menuController = AnimationController(
      duration: _animationDuration,
      reverseDuration: _menuReverseAnimationDuration,
      vsync: this,
    );
    _animation = Tween<double>( begin: 0.0, end: 1.0, ).animate(_menuController);
    _heightAnimation = Tween<double>( begin: 0.0, end: 1.0, ).animate(
      CurvedAnimation(
        parent: _menuController,
        curve: const Interval(
          0.0,
          0.5,
          curve: Curves.easeInOut,
        ),
      ),
    );
    _widthAnimation = Tween<double>( begin: 0.0, end: 1.0, ).animate(
      CurvedAnimation(
        parent: _menuController,
        curve: const Interval(
          0.2,
          0.7,
          curve: Curves.easeIn,
        ),
      ),
    );
    _textAnimation = Tween<double>( begin: 0.0, end: 1.0, ).animate(
      CurvedAnimation(
        parent: _menuController,
        curve: const Interval(
          0.5,
          1.0,
          curve: Curves.easeInOut,
        ),
      ),
    );
  }

  @override
  void dispose() {
    _menuController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        if (_menuController.isCompleted) menuFolderTap,
        Positioned.fill(
          child: Align( alignment: Alignment.topRight,
            child: unfoldMenu(
              child: SizedBox(
                width: sizes.rightPartCompactMenuSize.width + sizes.rightPartBox.W,
                height: sizes.rightPartCompactMenuSize.height + sizes.rightPartCompactMenuListTopDelta + sizes.rightPartBox.H,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    clickableIcon ,
                    listClickablePart,
                  ],
                ),
              ),),
          ),
        ),
      ],
    );
  }

  Widget unfoldMenu({required Widget child}) => Container(
    margin: sizes.horizontalMediumMargin.add(sizes.topSmallMargin),
    child: CustomPaint(
      painter: unfoldMenuPainter,
      child: child,
    ),
  );

  CustomPainter get unfoldMenuPainter => CompactMenuPainter(
    sizes: sizes,
    texts: PartEntity.names,
    animationPercent: _animation,
    heightAnimation: _heightAnimation,
    widthAnimation: _widthAnimation,
    repaint: _menuController,
  );

  Widget get menuFolderTap => GestureDetector(
    onTap: () {
      _menuController.reverse();
    },
  );

  Widget get listClickablePart => Padding(
    padding: EdgeInsetsDirectional.only(top: sizes.rightPartCompactMenuDelta),
    child: Column(
      children: [
        ...PartEntity.names.withoutLast.mapIndexed((i, name) => clickablePart(name, i, scrollAction(i)), ),
        clickablePart(PartEntity.resume.name, PartEntity.values.indexOf(PartEntity.resume), openResume)
        // clickablePart(text)
      ],
    ),
  );

  VoidCallback get openResume => () {
    launchUrl(Uri.parse(ref.watch(headerUrlNotifierProvider).build()));
  };
  VoidCallback scrollAction(int index) => () {
    ref.read(scrollRiverpod).updateIndexTo(index);
  };

  Widget clickablePart(String text, int index, VoidCallback onTap) => GestureDetector(
    onTap: onTap,
    child: Container(
      margin: sizes.horizontalLargeMargin,
      constraints: sizes.rightPartCompactTextBox,
      alignment: Alignment.centerLeft,
      child: AnimatedTextWidget(
        text: text,
        fontSize: sizes.fonts.medium,
        fontWeight: FontWeight.w600,
        textSize: _stringSizes[index],
        listenable: _menuController,
        animation: _textAnimation,
      ),
    ),
  );

  Widget get clickableIcon => GestureDetector(
    onTap: onMenuIconTap,
    child: Container(
      constraints: sizes.rightPartBox,
      alignment: Alignment.center,
      child: Icon(
        Symbols.menu,
        fill: 1,
        weight: 700,
        color: MyColors.visibleText,
        shadows: [
          Shadow(
            offset: const Offset(-0.5, -0.5),
            blurRadius: sizes.rightPartShadowTopBlueRadius,
            color: MyColors.textTopShadow,
          ),
          Shadow(
            offset: const Offset(1.2, 1.2),
            blurRadius: sizes.rightPartShadowBotBlueRadius,
            color: MyColors.textBotShadow,
          ),
        ],
      ),
    ),
  );

  VoidCallback get onMenuIconTap => () {
    if (_menuController.isCompleted) {
      _menuController.reverse();
    } else {
      _menuController.forward();
    }
  };
}
