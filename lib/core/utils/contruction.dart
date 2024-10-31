import 'package:flutter/material.dart';

class ToConstruct extends StatelessWidget {
  final double height;
  final double width;
  final String str;
  const ToConstruct({
    required this.height,
    required this.width,
    required this.str,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Placeholder(
        child: Container(
          alignment: Alignment.center,
          height: height,
          width: width,
          child: Text(str, style: const TextStyle(color: Colors.white)),
        ),
      );
  }
}
