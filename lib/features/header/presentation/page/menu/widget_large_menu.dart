import 'package:flutter/material.dart';
import 'package:vmb_portfolio/core/extensions/map.dart';
import 'package:vmb_portfolio/features/header/domain/entity/entity_part.dart';
import 'package:vmb_portfolio/features/header/presentation/page/menu/large/widget_button_large_header.dart';
import 'package:vmb_portfolio/features/header/presentation/page/sizes_header.dart';

class LargeMenuWidget extends StatelessWidget {
  final HeaderSizes sizes;
  const LargeMenuWidget({required this.sizes, super.key});

  @override
  Widget build(BuildContext context) => Row(
    children: PartEntity.values.mapIndexed((i, part)
    => ButtonLargeHeaderWidget( text: part.name, sizes: sizes, index: i,)).toList(),
  );
}
