import 'package:flutter/material.dart';
import 'package:jawnnypoo/ui/custom_colors.dart';

class Styles {
  static TextStyle logoStyle = const TextStyle(
    fontFamily: "FiraCode",
    fontSize: 40.0,
  );

  static TextStyle titleStyle = const TextStyle(
    fontSize: 30.0,
  );

  static TextStyle companyStyle = const TextStyle(
    color: Colors.grey,
    fontSize: 30.0,
  );

  static TextStyle bodyStyle = const TextStyle(
    fontSize: 22.0,
  );

  static TextStyle tabStyle = const TextStyle(fontSize: 18.0, color: Colors.grey);

  static TextStyle selectedTabStyle = tabStyle.copyWith(
      color: CustomColors.primaryColor(), fontWeight: FontWeight.bold);

  static TextStyle underlineStyle = const TextStyle(
    decoration: TextDecoration.underline,
  );

  static TextStyle baseStyle = const TextStyle();
}
