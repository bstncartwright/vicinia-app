import 'package:flutter/material.dart';

class ThemeFactory {
  Color blue() {
    return Color(0xff0c65fb);
  }

  Color grey() {
    return Color(0xffebf0f4);
  }

  Color _white() {
    return Color(0xffffffff);
  }

  Color dark() {
    return Color(0xff1d2b3b);
  }

  ThemeData _lightTheme() {
    return ThemeData(
      primaryColor: dark(),
      accentColor: dark(),
      canvasColor: grey(),
      scaffoldBackgroundColor: _white(),
      cardColor: Color(0xFFf2f2f2),
      fontFamily: 'Sans Serif',
    );
  }

  ThemeData _darkTheme() {
    return ThemeData.dark().copyWith(
      primaryColor: blue(),
      accentColor: blue(),
      canvasColor: dark(),
      scaffoldBackgroundColor: dark(),
      cardColor: dark(),
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
