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
  static const appBarText = TextStyle(
    fontFamily: 'Poppins',
    fontWeight: FontWeight.bold,
    fontSize: 33,
    height: 1,
    color: whiteColor,
  );
}
