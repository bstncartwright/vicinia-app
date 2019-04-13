import 'package:flutter/material.dart';
import 'package:dynamic_theme/dynamic_theme.dart';

import 'pages/pages.dart';
import 'utils/utils.dart';

void main() => runApp(Vicinia());

class Vicinia extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Constants(
      child: DynamicTheme(
        defaultBrightness: Brightness.light,
        data: (brightness) => ThemeFactory().getTheme(
              brightness,
            ),
        themedWidgetBuilder: (context, theme) {
          return MaterialApp(
            title: 'Vicinia',
            theme: theme,
            home: HomePage(),
          );
        },
      ),
    );
  }
}
