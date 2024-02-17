import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:weather_forecast_app/domain/models/weather_model.dart';

import 'package:weather_forecast_app/weather_app.dart';

// Список погодных данных. Привязан к списку сохранённых городов*
late List<WeatherModel?> weatherInSavedCities;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final prefs = await SharedPreferences.getInstance();
  runApp(WeatherApp(prefs));
}

// https://api.flutter.dev/flutter/intl/DateFormat-class.html
