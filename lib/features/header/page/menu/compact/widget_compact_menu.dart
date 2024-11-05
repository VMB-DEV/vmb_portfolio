import 'package:flutter/material.dart';
import 'package:material_symbols_icons/material_symbols_icons.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:vmb_portfolio/core/extensions/map.dart';
import 'package:vmb_portfolio/core/presentation/text/widget_animated_text.dart';
import 'package:vmb_portfolio/features/header/domain/PartEntity.dart';
import 'package:vmb_portfolio/features/header/page/menu/compact/painter_compact_menu.dart';
import 'package:vmb_portfolio/features/header/page/sizes_header.dart';
import '../../../../../core/constants/custom_colors.dart';
import '../../../../../core/state_management/riverpod/provider_scroll.dart';

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

  @override
  void initState() {
    super.initState();
    _animationDuration = _menuAnimationDuration + _textAnimationDuration;
    _stringSizes = widget.sizes.stringSizes;
    _menuController = AnimationController(
      duration: _animationDuration,
      reverseDuration: _menuReverseAnimationDuration,
      vsync: this,
    )..forward();
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
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  clickableIcon ,
                  listClickablePart,
                ],
              ),),
          ),
        ),
      ],
    );
  }

  Widget unfoldMenu({required Widget child}) => Container(
    margin: widget.sizes.horizontalMediumMargin.add(widget.sizes.topSmallMargin),
    child: CustomPaint(
      painter: unfoldMenuPainter,
      child: child,
    ),
  );

  CustomPainter get unfoldMenuPainter => CompactMenuPainter(
    sizes: widget.sizes,
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
    padding: EdgeInsetsDirectional.only(top: widget.sizes.rightPartCompactMenuDelta),
    child: Column(
      children: PartEntity.names.mapIndexed((i, name)
      => GestureDetector(
        onTap: () {
          ref.read(scrollRiverpod).updateIndexTo(i);
        },
        child: Container(
          margin: widget.sizes.horizontalLargeMargin,
          constraints: widget.sizes.rightPartCompactTextBox,
          // color: MyColors.test3,
          // alignment: Alignment.centerRight,
          alignment: Alignment.centerLeft,
          child: AnimatedTextWidget(
            text: name,
            fontSize: widget.sizes.rightPartFontSize,
            fontWeight: FontWeight.w600,
            textSize: _stringSizes[i],
            listenable: _menuController,
            animation: _textAnimation,
          ),
        ),
      )).toList(),
    ),
  );

  Widget get clickableIcon => GestureDetector(
    onTap: onMenuIconTap,
    child: Container(
      constraints: widget.sizes.rightPartBox,
      alignment: Alignment.center,
      child: Icon(
        Symbols.menu,
        fill: 1,
        weight: 700,
        color: MyColors.bigText,
        shadows: [
          Shadow(
            offset: const Offset(-0.5, -0.5),
            blurRadius: widget.sizes.rightPartShadowTopBlueRadius,
            color: MyColors.textTopShadow,
          ),
          Shadow(
            offset: const Offset(1.2, 1.2),
            blurRadius: widget.sizes.rightPartShadowBotBlueRadius,
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