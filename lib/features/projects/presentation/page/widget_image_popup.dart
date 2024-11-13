import 'dart:ui' as ui;
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:vmb_portfolio/core/constants/custom_colors.dart';

class ImagePopupWidget extends StatelessWidget {
  final String heroTag;
  final ui.Image image;

  const ImagePopupWidget({
    required this.heroTag,
    required this.image,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColors.darkFilter,
      body: Stack(
        children: [
          // Centered image with Hero animation
          Center(
            child: Hero(
              tag: heroTag,
              child: RawImage(
                image: image,
                fit: BoxFit.contain,
              ),
            ),
          ),
          // Close button
          Positioned(
            top: 40,
            right: 20,
            child: IconButton(
              icon: const Icon(Icons.close, color: Colors.white),
              onPressed: () => Navigator.pop(context),
            ),
          ),
          // Make the entire screen tappable to close
          Positioned.fill(
            child: Material(
              color: Colors.transparent,
              child: InkWell(
                onTap: () => Navigator.pop(context),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
