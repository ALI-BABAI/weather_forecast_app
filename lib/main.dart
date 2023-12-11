import 'dart:io';
import 'dart:convert';
import 'package:path_provider/path_provider.dart';
import 'package:weather_forecast_app/data_handling/serialisator/cities.dart';

import 'package:flutter/material.dart';
import 'package:weather_forecast_app/data_handling/serialisator/weather_data.dart';
import 'package:weather_forecast_app/screens/home_screen/home_screen.dart';
import 'package:weather_forecast_app/screens/settings_screen/settings_screen.dart';

// глобавльная переменная, хранящая список сохранённых городов
// может меняться внутри любого экрана и изменения будут актуальны везде.
late SavedCitiesData? savedCitiesData;
late List<WeatherData?> weatherInSavedCities;
late File savedCitiesFile;

void main() async {
  // ошибка без строки
  WidgetsFlutterBinding.ensureInitialized();

  // получаем расположение дефолтной директории файлов программы
  Directory appDirectory = await getApplicationDocumentsDirectory();
  String appDirectoryPath = appDirectory.path;

  // формируем путь к файлу который нас интересует
  // и создаём объект == самому файлу
  final savedCitiesFilePath = '$appDirectoryPath/saved_cities.json';
  savedCitiesFile = File(savedCitiesFilePath);

  // если файла нет, он создаётся с дефолтным городом
  if (!await savedCitiesFile.exists()) {
    SavedCitiesData initialData = SavedCitiesData(
      favouriteCities: [
        ApiCity(
          name: "Samara",
          country: "RU",
          location: Location(lon: 50.150002, lat: 53.200001),
        ),
        ApiCity(
          name: "Ulyanovsk",
          country: "RU",
          location: Location(lon: 48.400002, lat: 54.333332),
        ),
      ],
    );
    // записываем в файл
    await savedCitiesFile.writeAsString(jsonEncode(initialData));
  }

  // Подтягиваем инфу по выбранному и избранным городам в приложение
  // Получаем объект == списку сохранённых городов (типа ApiCity)
  savedCitiesData = await readSavedCitiesInfo(savedCitiesFile);

  // полученный список передать в HomeScreen чтобы
  // в отдельный список сохранить данные по сохранённым городам?
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

Future<SavedCitiesData?> readSavedCitiesInfo(File savedCitiesFile) async {
  try {
    // считываем файл и записываем его в строку
    // вызываем метод преобразующий ключи в объект
    final String data = await savedCitiesFile.readAsString();
    final Map<String, dynamic> jsonData = jsonDecode(data);
    return SavedCitiesData.fromJson(jsonData);
  } catch (exeption) {
    debugPrint('Ошибка при чтении файла: $exeption');
    return null;
  }
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

//  favourite_cities.json
// {
//   "favouriteCities": [
//     {
//       "name": "Taglag",
//       "country": "IR",
//       "lon": 44.98333,
//       "lat": 38.450001
//     },
//     {
//       "name": "Ufa",
//       "country": "RU",
//       "lon": 55.9579,
//       "lat": 54.7348
//     }
//   ]
// }
