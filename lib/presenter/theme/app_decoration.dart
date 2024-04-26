import 'package:flutter/material.dart';
import 'package:weather_forecast_app/presenter/theme/app_colors.dart';

abstract class AppDecorations {
  static const darkDecorationTheme = BoxDecoration(
    gradient: AppGradients.darkBackground,
  );

  static const lightDecorationTheme = BoxDecoration(
    gradient: AppGradients.lightBackground,
  );
}

abstract class AppGradients {
  static const darkBackground = LinearGradient(
    colors: AppColors.darkGradientBackground,
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
  );

  static const lightBackground = LinearGradient(
    colors: AppColors.lightGradientBackground,
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
  );
}
