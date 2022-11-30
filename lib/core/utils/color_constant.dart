import 'package:flutter/material.dart';

class ColorConstant {
  static Color black = Colors.black;
  static Color white = Colors.white;
  static Color grey = fromHex('#28302E');
  static Color offWhite = fromHex('#eeeeee');

  static Color fromHex(String hexString) {
    final buffer = StringBuffer();
    if (hexString.length == 6 || hexString.length == 7) buffer.write('ff');
    buffer.write(hexString.replaceFirst('#', ''));
    return Color(int.parse(buffer.toString(), radix: 16));
  }
}
