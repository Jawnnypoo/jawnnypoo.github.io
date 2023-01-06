import 'package:flutter/material.dart';
import 'package:jawnnypoo/ui/custom_colors.dart';

var logoStyle = const TextStyle(
  fontFamily: "FiraCode",
  fontSize: 30.0,
);

var titleStyle = const TextStyle(
  fontSize: 30.0,
);

var companyStyle = const TextStyle(
  color: Colors.grey,
  fontSize: 20.0,
);

var bodyStyle = const TextStyle(
  fontSize: 16.0,
);

var tabStyle = const TextStyle(fontSize: 18.0, color: Colors.grey);

var selectedTabStyle = tabStyle.copyWith(
    color: CustomColors.primaryColor(), fontWeight: FontWeight.bold);

var underlineStyle = const TextStyle(
  decoration: TextDecoration.underline,
);

var baseStyle = const TextStyle();
