import 'dart:ui' as ui;

import 'package:flutter/cupertino.dart';
import 'package:vmb_portfolio/core/data/values/url_type.dart';

class IconTextLinkEntity {
  final String text;
  final String urlString;
  final ui.Image icon;

  IconTextLinkEntity({
    required this.text,
    required this.urlString,
    required this.icon
  });

  factory IconTextLinkEntity.from(UrlType type, ui.Image icon) => IconTextLinkEntity(
    text: type.text,
    urlString: type.urlString,
    icon: icon,
  );
}