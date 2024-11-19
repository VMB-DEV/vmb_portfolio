import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:vmb_portfolio/core/presentation/text/widget_animated_text.dart';
import 'package:vmb_portfolio/features/catcher/presentation/page/sizes_catcher.dart';

import '../../../features/catcher/data/values/data_catcher.dart';
import '../../../features/catcher/domain/entity/entity_catcher_strings.dart';
import '../../../features/catcher/presentation/state_management/strings/provider_catcher_strings.dart';
import '../../constants/custom_colors.dart';
import '../../data/values/languages.dart';
import '../../state_management/riverpod/language/provider_language.dart';

class MyDescriptionWidget extends ConsumerStatefulWidget {
  final String buttonText;
  final String descriptionText;
  final double descriptionMaxWidth;
  final double fontSize;

  const MyDescriptionWidget({
    required this.buttonText,
    required this.descriptionText,
    required this.descriptionMaxWidth,
    required this.fontSize,
    super.key,
  });

  @override
  ConsumerState<MyDescriptionWidget> createState() => _MyDescriptionState();
}

class _MyDescriptionState extends ConsumerState<MyDescriptionWidget> with SingleTickerProviderStateMixin {
  final duration = const Duration(milliseconds: 500);
  late AnimationController _controller;
  late Animation<double> _animationValue;
  bool descriptionState = false;
  bool onHover = false;
  CatcherStringsEntity get stringsData => ref.watch(catcherStringsNotifierProvider).requireValue.entity.requireValue;
  Languages get language => ref.watch(languageProvider).requireValue.language.requireValue;
  Languages? _previousLanguage;

  @override
  void initState() {
    _controller = AnimationController(
      duration: duration,
      value: 0,
      vsync: this,
    );

    _animationValue = Tween<double>(
      begin: 0,
      end: 1,
    ).animate(_controller);
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (_previousLanguage != null && _previousLanguage != language) {
      _controller.reverse().whenComplete(() {
        _controller.forward();
      });
    } else if (_previousLanguage == null) {
      _controller.forward(from: 0);
    }
    _previousLanguage = language;

    return descriptionState == true ? Container(
      width: widget.descriptionMaxWidth,
      child: AnimatedTextWidget(
        text: widget.descriptionText,
        fontSize: widget.fontSize,
        fontWeight: FontWeight.w600,
        animation: _animationValue,
        listenable: _controller,
        textMaxWidth: widget.descriptionMaxWidth,
      ),
    ) : InkWell(
      onTap: () => setState(() {
        descriptionState = true;
        _controller.reset();
        _controller.forward();
      }),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.all(Radius.elliptical(10, 5)),
          border: Border.all(
            color: MyColors.visibleText,
          ),
        ),
        child: AnimatedTextWidget(
          text: widget.buttonText,
          fontSize: widget.fontSize,
          fontWeight: FontWeight.w600,
          animation: _animationValue,
          listenable: _controller,
          textMaxWidth: widget.descriptionMaxWidth,
        ),
      ),
    ) ;
  }
}
