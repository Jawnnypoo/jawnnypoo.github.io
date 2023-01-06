import 'package:flutter/material.dart';
import 'package:jawnnypoo/ui/styles.dart';

Widget nothing() {
  return const SizedBox();
}

Widget verticalSeparator() {
  return const SizedBox(
    height: 20.0,
  );
}

Widget horizontalSeparator() {
  return const SizedBox(
    width: 20.0,
  );
}

Widget title(String title) {
  return SelectableText(
    title,
    style: titleStyle,
  );
}

Widget text(String text) {
  return SelectableText(
    text,
    style: bodyStyle,
  );
}
