import 'package:flutter/material.dart';
import 'package:weather_forecast_app/theme/app_colors.dart';

TextStyle poppinsRegularExtended(
    double fontSize, Color color, FontWeight fontWeight) {
  return TextStyle(
    // fontFamily: 'Poppins',
    fontWeight: fontWeight,
    fontSize: fontSize,
    height: 1,
    color: color,
  );
}

abstract class AppTextStyles {
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
