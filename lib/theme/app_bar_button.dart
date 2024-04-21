import 'package:flutter/material.dart';
import 'package:weather_forecast_app/theme/app_colors.dart';

abstract class AppButtonsStyle {
  static final navigationBtn = ButtonStyle(
    padding: const MaterialStatePropertyAll(EdgeInsets.all(5)),
    backgroundColor: const MaterialStatePropertyAll(AppColors.mainBackground),
    shape: MaterialStatePropertyAll(
      RoundedRectangleBorder(
        side: const BorderSide(color: AppColors.mainBackground),
        borderRadius: BorderRadius.circular(5),
      ),
    ),
  );
}
