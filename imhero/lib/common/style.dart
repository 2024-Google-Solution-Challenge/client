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

Widget bottomNavigationCircle() {
  return Container(
    width: 20,
    height: 20,
    decoration: const BoxDecoration(
      shape: BoxShape.circle,
      gradient: LinearGradient(
        colors: [
          Color(0xffE6D7FF),
          Color(0xffDCFFE8),
        ],
      ),
    ),
  );
}
