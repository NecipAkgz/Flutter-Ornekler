import 'dart:math';

import 'package:flutter/material.dart';

class RasgeleRenk {
  static final random = Random();

  /// Verilen minimum parpaklık değeri ile rasgele renk olusturur
  static Color renkUret({int minBrightness = 50}) {
    assert(minBrightness >= 0 && minBrightness <= 255);
    return Color.fromARGB(
      0xFF,
      minBrightness + random.nextInt(255 - minBrightness),
      minBrightness + random.nextInt(255 - minBrightness),
      minBrightness + random.nextInt(255 - minBrightness),
    );
  }
}
