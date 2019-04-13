import 'package:flutter/material.dart';

class ThemeFactory {
  Color _blue() {
    return Color(0xff0c65fb);
  }

  Color _grey() {
    return Color(0xffebf0f4);
  }

  Color _white() {
    return Color(0xfffffff);
  }

  Color _dark() {
    return Color(0xff1d2b3b);
  }

  ThemeData _lightTheme() {
    return ThemeData.light().copyWith(
      primaryColor: _blue(),
      accentColor: _blue(),
      canvasColor: _grey(),
      scaffoldBackgroundColor: _grey(),
      cardColor: _white(),
    );
  }

  ThemeData _darkTheme() {
    return ThemeData.dark().copyWith(
      primaryColor: _blue(),
      accentColor: _blue(),
      canvasColor: _dark(),
      scaffoldBackgroundColor: _dark(),
      cardColor: _dark(),
    );
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
