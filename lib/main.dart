import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:weather_forecast_app/data/repository/login_repository_impl.dart';
import 'package:weather_forecast_app/data/repository/settings_repository_impl.dart';
import 'package:weather_forecast_app/data/repository/weather_repository_impl.dart';
import 'package:weather_forecast_app/data/services/storage_service.dart';

import 'package:weather_forecast_app/weather_app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final prefs = await SharedPreferences.getInstance();
  const secureStorage = FlutterSecureStorage();
  final storageService = StorageService(prefs);
  final WeatherRepositoryImpl weatherRepository =
      WeatherRepositoryImpl(storageService);
  final SettingsRepositoryImpl settingsRepository =
      SettingsRepositoryImpl(storageService);
  final LoginRepositoryImpl loginRepository =
      LoginRepositoryImpl(secureStorage);
  runApp(
    WeatherApp(
      weatherRepository: weatherRepository,
      settingsRepository: settingsRepository,
      loginRepository: loginRepository,
    ),
  );
}
