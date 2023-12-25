import 'dart:io';
import 'package:flutter/material.dart';
import 'package:weather_forecast_app/data_handling/directory/initialize_app.dart';
import 'package:weather_forecast_app/data_handling/network/models/city/cities.dart';
import 'package:weather_forecast_app/data_handling/network/models/weather/weather_data.dart';

import 'package:weather_forecast_app/routes/routes.dart';
import 'package:weather_forecast_app/theme/app_main_themes.dart';

// глобавльная переменная, хранящая список сохранённых городов
// может меняться внутри любого экрана и изменения будут актуальны везде.
/* Формат списка сохранённых городов:
    //  Файл saved_cities.json:
{
  "savedCitiesData": [
    {
      "name": "Taglag",
      "country": "IR",
      "lon": 44.98333,
      "lat": 38.450001
    },
    {
      "name": "Ufa",
      "country": "RU",
      "lon": 55.9579,
      "lat": 54.7348
    }
  ]
}*/
late SavedCitiesData? savedCitiesData;
late List<WeatherData?> weatherInSavedCities;
late File savedCitiesFile;

void main() async {
  // ошибка без строки
  WidgetsFlutterBinding.ensureInitialized();

  // Получение/создание списка сохранённых городов на устройстве пользователя
  await initializeApp();
  runApp(
    MaterialApp(
      theme: mainThemes,
      title: 'Weather forecast',
      initialRoute: '/home',
      routes: routes,
    ),
  );
}

// https://api.flutter.dev/flutter/intl/DateFormat-class.html

// Работа с файлами на устройстве:
// https://pub.dev/packages/path_provider/example

/*
**   Необходимо указать компилятору необходимость включения файла city_list.json
**   в сборку проекта.
**   В pubspec.yaml указать как ассет
*   
*    WidgetsFlutterBinding.ensureInitialized();
**   Чтение содержимого файла из ассетов
*    String jsonString = await rootBundle.loadString('assets/city_list.json');
*/
