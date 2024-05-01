import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:weather_forecast_app/src/data/repository/login_repository_impl.dart';
import 'package:weather_forecast_app/src/data/repository/settings_repository_impl.dart';
import 'package:weather_forecast_app/src/data/repository/weather_repository_impl.dart';
import 'package:weather_forecast_app/src/data/services/storage_service.dart';

import 'package:weather_forecast_app/src/weather_app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final prefs = await SharedPreferences.getInstance();
  final storageService = StorageService(prefs);
  const secureStorage = FlutterSecureStorage();
  final weatherRepository = WeatherRepositoryImpl(storageService);
  final settingsRepository = SettingsRepositoryImpl(storageService);
  final loginRepository = LoginRepositoryImpl(secureStorage);
  runApp(
    WeatherApp(
      weatherRepository: weatherRepository,
      settingsRepository: settingsRepository,
      loginRepository: loginRepository,
    ),
  );
}
