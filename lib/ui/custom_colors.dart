import 'package:flutter/material.dart';

/// Colors used throughout the app
class CustomColors {
  CustomColors._();
  static const _primary = 0xFFfd5b3b;
  static const _r = 253;
  static const _g = 91;
  static const _b = 59;

  static Color primaryColor() {
    return const Color(_primary);
  }

  static MaterialColor primaryMaterialColor() {
    Map<int, Color> color = {
      50: const Color.fromRGBO(_r, _g, _b, .1),
      100: const Color.fromRGBO(_r, _g, _b, .2),
      200: const Color.fromRGBO(_r, _g, _b, .3),
      300: const Color.fromRGBO(_r, _g, _b, .4),
      400: const Color.fromRGBO(_r, _g, _b, .5),
      500: const Color.fromRGBO(_r, _g, _b, .6),
      600: const Color.fromRGBO(_r, _g, _b, .7),
      700: const Color.fromRGBO(_r, _g, _b, .8),
      800: const Color.fromRGBO(_r, _g, _b, .9),
      900: const Color.fromRGBO(_r, _g, _b, 1),
    };
    return MaterialColor(_primary, color);
  }
}
