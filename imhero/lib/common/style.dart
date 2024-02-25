import 'package:flutter/material.dart';
import 'package:imhero/common/colors.dart';

TextStyle underLineTextStyle() {
  return const TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.bold,
    color: BODY_TITLE_COLOR,
    decoration: TextDecoration.underline,
    decorationColor: HIGHLIGHT_COLOR,
    decorationThickness: 5,
  );
}
