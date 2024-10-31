import 'package:flutter/cupertino.dart';
import 'package:vmb_portfolio/core/extensions/box_constraints.dart';

class CompactMenuWidget extends StatelessWidget {
  final BoxConstraints box;
  const CompactMenuWidget({required this.box, super.key});

  @override
  Widget build(BuildContext context) => SizedBox(
    height: box.H,
    width: box.W,
    child: const Placeholder(),
  );
}
