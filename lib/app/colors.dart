import 'package:flutter/material.dart';

class HexColor {
  static Color fromHex(String hexString) {
    final buffer = StringBuffer();
    if (hexString.length == 6 || hexString.length == 7) buffer.write('ff');
    buffer.write(hexString.replaceFirst('#', ''));
    return Color(int.parse(buffer.toString(), radix: 16));
  }
}

class AppColors {
  static final Color primaryColor = HexColor.fromHex('#CD0000');
  static final Color secondaryColor = HexColor.fromHex('#2196F3');
  static final Color accentColor = HexColor.fromHex('#FFC107');
}
