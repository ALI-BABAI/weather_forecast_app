import 'package:flutter/material.dart';
import 'package:weather_forecast_app/theme/colors.dart';

TextStyle poppinsRegularExtended(
    double fontSize, Color color, FontWeight fontWeight) {
  return TextStyle(
    fontFamily: 'Poppins',
    fontWeight: fontWeight,
    fontSize: fontSize,
    height: 1,
    color: color,
  );
}

abstract class AppTextStyles {
  static const appBarFont = TextStyle(
    fontFamily: 'Poppins',
    fontWeight: FontWeight.bold,
    fontSize: 33,
    height: 1,
    color: whiteColor,
  );
  static const settingsScreenHeaderFont = TextStyle(
    fontFamily: 'Poppins',
    fontWeight: FontWeight.w500,
    fontSize: 28,
    height: 1,
    color: orangeColor,
  );
  static const expandedMainFont = TextStyle(
    fontFamily: 'Poppins',
    fontWeight: FontWeight.w500,
    fontSize: 20,
    height: 1,
    color: whiteColor,
  );
  static const mainFont = TextStyle(
    fontFamily: 'Poppins',
    fontWeight: FontWeight.w500,
    fontSize: 15,
    height: 1,
    color: whiteColor,
  );
  static const secondaryFont = TextStyle(
    fontFamily: 'Poppins',
    fontWeight: FontWeight.w500,
    fontSize: 15,
    height: 1,
    color: grayColor,
  );
  static const smallestSecondaryFont = TextStyle(
    fontFamily: 'Poppins',
    fontWeight: FontWeight.w500,
    fontSize: 12,
    height: 1,
    color: grayColor,
  );
}
