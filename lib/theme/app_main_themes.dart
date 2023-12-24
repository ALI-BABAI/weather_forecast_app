import 'package:flutter/material.dart';
import 'package:weather_forecast_app/theme/app_colors.dart';
import 'package:weather_forecast_app/theme/app_text_styles.dart';

final mainThemes = ThemeData(
  fontFamily: 'Poppins',
  textTheme: const TextTheme(
    titleLarge: AppTextStyles.appBarFont,
    titleSmall: AppTextStyles.settingsScreenHeaderFont,
  ),
  appBarTheme: const AppBarTheme(
    backgroundColor: AppColors.mainBackground,
    toolbarHeight: 50,
    titleSpacing: 30, // отступ
    elevation: 4, // тень
  ),
  // для некоторых иконок свойство color не отрабатывает
  iconTheme: const IconThemeData(
    color: AppColors.white,
    size: 25,
  ),
);
