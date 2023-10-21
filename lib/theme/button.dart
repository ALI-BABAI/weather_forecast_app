import 'package:flutter/material.dart';

abstract class AppNavigattionButtonStyle {
  static final buttonStyle = ButtonStyle(
    padding: const MaterialStatePropertyAll(
      EdgeInsets.all(5),
    ),
    backgroundColor: const MaterialStatePropertyAll(Color(0xFF484B5B)),
    shape: MaterialStatePropertyAll(
      RoundedRectangleBorder(
        // side: const BorderSide(color: orangeColor),
        borderRadius: BorderRadius.circular(10),
      ),
    ),
  );
}
