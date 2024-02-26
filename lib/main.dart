import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:weather_forecast_app/data/repository/app_repository.dart';
import 'package:weather_forecast_app/data/services/storage_service.dart';

import 'package:weather_forecast_app/weather_app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final prefs = await SharedPreferences.getInstance();
  final AppRepositoryImpl appRepository =
      AppRepositoryImpl(StorageService(prefs));
  runApp(WeatherApp(appRepository));
}
