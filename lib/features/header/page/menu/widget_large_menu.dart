import 'package:flutter/cupertino.dart';
import 'package:vmb_portfolio/core/extensions/box_constraints.dart';

class LargeMenuWidget extends StatelessWidget {
  final BoxConstraints box;
  const LargeMenuWidget({required this.box , super.key});

  @override
  Widget build(BuildContext context) => SizedBox(
    height: box.H,
    width: box.W,
    child: const Placeholder(),
  );
}
