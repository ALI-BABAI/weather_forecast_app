// https://habr.com/ru/articles/690572/   // темы приложения
// https://habr.com/ru/articles/776682/   // работа с шрифтами и виджетом Техт

import 'package:flutter/material.dart';
import 'package:weather_forecast_app/src/presenter/theme/app_colors.dart';
import 'package:weather_forecast_app/src/presenter/theme/app_text_styles.dart';

final mainThemes = ThemeData(
  fontFamily: 'Poppins',
  textTheme: const TextTheme(
    titleLarge: AppTextStyles.appBarFont,
    titleSmall: AppTextStyles.settingsScreenHeaderFont,
  ),
  appBarTheme: const AppBarTheme(
    backgroundColor: AppColors.mainBackground,
    toolbarHeight: 50,
    titleSpacing: 30, // offset
    elevation: 4, // shadow
  ),
  iconTheme: const IconThemeData(
    color: AppColors.white,
    size: 25,
  ),
  colorScheme: const ColorScheme.dark(
    primary: AppColors.mainBackground,
    // background when dragging the widget
    background: AppColors.mainBackground,
  ),
);
