import 'package:flutter/material.dart';

final appBarButtonStyle = ButtonStyle(
  padding: const MaterialStatePropertyAll(
    EdgeInsets.all(5),
  ),
  shape: MaterialStatePropertyAll(
    RoundedRectangleBorder(
      // side: const BorderSide(color: AppColors.orange),
      borderRadius: BorderRadius.circular(5),
    ),
  ),
);
