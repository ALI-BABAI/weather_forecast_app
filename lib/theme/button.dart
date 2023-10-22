import 'package:flutter/material.dart';
import 'package:weather_forecast_app/theme/colors.dart';

abstract class AppNavigattionButtonStyle {
  static final buttonStyle = ButtonStyle(
    padding: const MaterialStatePropertyAll(
      EdgeInsets.all(5),
    ),
    backgroundColor: const MaterialStatePropertyAll(AppColors.appBackground),
    shape: MaterialStatePropertyAll(
      RoundedRectangleBorder(
        // side: const BorderSide(color: AppColors.orange),
        borderRadius: BorderRadius.circular(5), //10
      ),
    ),
  );
}
