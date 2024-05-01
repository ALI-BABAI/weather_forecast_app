// https://habr.com/ru/articles/690572/   // темы приложения
// https://habr.com/ru/articles/776682/   // работа с шрифтами и виджетом Техт

import 'package:flutter/material.dart';
import 'package:weather_forecast_app/presenter/theme/app_colors.dart';

abstract class AppTextStyles {
  static const loadingScreenFont = TextStyle(
    fontWeight: FontWeight.bold,
    fontSize: 22,
    color: AppColors.darkBlue,
    height: 1,
  );
  static const appBarFont = TextStyle(
    fontWeight: FontWeight.bold,
    fontSize: 33,
    color: AppColors.white,
  );
  static const settingsScreenHeaderFont = TextStyle(
    fontWeight: FontWeight.w500,
    fontSize: 28,
    height: 1,
    color: AppColors.orange,
  );
  static const expandedMainFont = TextStyle(
    fontWeight: FontWeight.w500,
    fontSize: 20,
    height: 1,
    color: AppColors.white,
  );
  static const mainFont = TextStyle(
    fontWeight: FontWeight.w500,
    fontSize: 15,
    height: 1,
    color: AppColors.white,
  );
  static const secondaryFont = TextStyle(
    fontWeight: FontWeight.w500,
    fontSize: 15,
    height: 1,
    color: AppColors.gray,
  );
  static const smallestSecondaryFont = TextStyle(
    fontWeight: FontWeight.w500,
    fontSize: 12,
    height: 1,
    color: AppColors.gray,
  );
}
