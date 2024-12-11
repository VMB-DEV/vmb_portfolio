import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:vmb_portfolio/core/extensions/list.dart';
import 'package:vmb_portfolio/core/extensions/map.dart';
import 'package:vmb_portfolio/features/header/domain/entity/entity_part.dart';
import 'package:vmb_portfolio/features/header/presentation/page/menu/large/widget_button_large_header.dart';
import 'package:vmb_portfolio/features/header/presentation/page/menu/large/widget_switch_langugae.dart';
import 'package:vmb_portfolio/features/header/presentation/page/sizes_header.dart';

import '../../../../../../core/state_management/riverpod/scroll/provider_scroll.dart';
import '../../../state_management/provider_header_url.dart';

class LargeMenuWidget extends ConsumerWidget {
  final HeaderSizes sizes;
  const LargeMenuWidget({required this.sizes, super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) => Row(
    children: [
      ...PartEntity.values.sublist(0, 3).mapIndexed((i, part)
      => ButtonLargeHeaderWidget(
        text: part.name,
        sizes: sizes,
        index: i,
        onTap: updateResume(ref, i),
      )),
      ButtonLargeHeaderWidget(
        text: PartEntity.resume.name,
        sizes: sizes,
        index: PartEntity.resume.index,
        onTap: openResume(ref)
      ),
      LanguageSwitchWidget(sizes: sizes),
    ]
    ,
  );

  VoidCallback updateResume(WidgetRef ref, int index) => () {
    ref.read(scrollRiverpod).updateIndexTo(index);
  };
  VoidCallback openResume(WidgetRef ref) => () {
    launchUrl(Uri.parse(ref.watch(headerUrlNotifierProvider).build()));
  };
}