import 'package:flutter/material.dart';
import 'package:weather_forecast_app/routes/routes.dart';
import 'package:weather_forecast_app/theme/app_main_themes.dart';
import 'package:weather_forecast_app/theme/src/text_constants.dart';

class WeatherApp extends StatelessWidget {
  const WeatherApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: mainThemes,
      title: AppTextConstants.materialAppTitle,
      initialRoute: AppRoutes.homeRoute,
      routes: AppRoutes.routes,
    );
  }
}
