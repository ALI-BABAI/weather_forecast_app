import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:weather_forecast_app/repositories/preferency_manager.dart';
import 'package:weather_forecast_app/routes/routes.dart';
import 'package:weather_forecast_app/theme/app_main_themes.dart';
import 'package:weather_forecast_app/theme/src/text_constants.dart';

class WeatherApp extends StatelessWidget {
  final SharedPreferences prefs;
  const WeatherApp(this.prefs, {super.key, required});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => PreferencesManager(prefs),
      child: MaterialApp(
        theme: mainThemes,
        title: AppTextConstants.materialAppTitle,
        initialRoute: AppRoutes.homeRoute,
        routes: AppRoutes.routes,
      ),
    );
  }
}
