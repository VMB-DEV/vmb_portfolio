import 'package:flutter/material.dart';

class ToConstruct extends StatelessWidget {
  final double height;
  final double width;
  final String str;
  final BoxConstraints? box;
  const ToConstruct({
    required this.str,
    this.height = 5,
    this.width = 5,
    this.box,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Placeholder(
        child: box != null ? Container(
          alignment: Alignment.center,
          constraints: box,
          child: Text(str, style: const TextStyle(color: Colors.white)),
        ) : Container(
          alignment: Alignment.center,
          height: height,
          width: width,
          child: Text(str, style: const TextStyle(color: Colors.white)),
        ),
      );
  }
}
