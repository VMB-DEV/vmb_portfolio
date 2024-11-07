import 'dart:ui';

import 'package:vmb_portfolio/core/data/values/url_type.dart';

class IconTextLinkEntity {
  final String text;
  final String urlString;
  final Image icon;

  IconTextLinkEntity({
    required this.text,
    required this.urlString,
    required this.icon
  });

  factory IconTextLinkEntity.from(UrlType type, Image icon) => IconTextLinkEntity(
    text: type.text,
    urlString: type.urlString,
    icon: icon,
  );
}