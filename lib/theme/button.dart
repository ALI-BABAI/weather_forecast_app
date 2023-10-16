import 'package:flutter/material.dart';

abstract class AppNavigattionButtonStyle {
  static final buttonStyle = ButtonStyle(
    minimumSize: const MaterialStatePropertyAll(Size(40, 40)),
    padding: const MaterialStatePropertyAll(
      EdgeInsets.all(5),
    ),
    backgroundColor: const MaterialStatePropertyAll(Color(0xFF484B5B)),
    shape: MaterialStatePropertyAll(
      RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
    ),
  );
}
