import 'package:flutter/material.dart';
import 'package:weather_forecast_app/screens/home_screen/home_screen.dart';
import 'package:weather_forecast_app/screens/settings_screen/settings_screen.dart';

// https://api.flutter.dev/flutter/intl/DateFormat-class.html

// Работа с файлами на устройстве:
// https://pub.dev/packages/path_provider/example
// import 'package:path_provider/path_provider.dart';

// - считать файл с списком городов
// - сохранять избранные города в файле + олд.данные


void main() {
  runApp(
    MaterialApp(
      title: 'Weather forecast',
      initialRoute: '/home',
      routes: {
        '/home': (context) => const HomeScreen(),
        '/settings': (context) => const SettingsScreen(),
      },
    ),
  );
}
