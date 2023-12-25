import 'package:flutter/material.dart';
import 'package:weather_forecast_app/theme/app_colors.dart';

const appDecoration = BoxDecoration(
  gradient: appGradientBackground,
);

const appGradientBackground = LinearGradient(
  colors: AppColors.gradientBackground,
  begin: Alignment.topCenter,
  end: Alignment.bottomCenter,
);
