import 'package:flutter/material.dart';

enum ImageAssets { agent, person, valorant, weapon }

extension ImageAssetsExtension on ImageAssets {
  String get toPath => "assets/images/$name.png";
  Image get toImage => Image.asset(toPath);
  Image toImageWithColor(Color color) {
    return Image.asset(
      toPath,
      color: color,
    );
  }
}
