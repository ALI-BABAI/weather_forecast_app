import 'dart:convert';
import 'dart:io';

import 'package:path_provider/path_provider.dart';
import 'package:weather_forecast_app/data_handling/directory/read_cities.dart';
import 'package:weather_forecast_app/data_handling/network/models/city/cities.dart';
import 'package:weather_forecast_app/main.dart';

Future initializeApp() async {
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
}