import 'package:flutter/material.dart';

class AppColor {
  static const orange = Color(0xFFFC6011);
  static const primary = Color.fromARGB(255, 73, 111, 187);
  static const secondary = Color.fromARGB(255, 255, 255, 255);
  static const placeholder = Color(0xFFB6B7B7);
  static const placeholderBg = Color(0xFFF2F2F2);
  static const logoBg = Color(0xFF202B73);
}

class Helper {
  static double getScreenWidth(BuildContext context) {
    return MediaQuery.of(context).size.width;
  }

  static double getScreenHeight(BuildContext context) {
    return MediaQuery.of(context).size.height;
  }
}
