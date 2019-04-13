import 'package:flutter/material.dart';

class ThemeFactory {
  ThemeData _lightTheme() {
    return ThemeData.light().copyWith();
  }

  ThemeData _darkTheme() {
    return ThemeData.dark().copyWith();
  }

  ThemeData getTheme(Brightness brightness) {
    switch (brightness) {
      case Brightness.light:
        return _lightTheme();
      case Brightness.dark:
        return _darkTheme();
      default:
        return _lightTheme();
    }
  }
}
