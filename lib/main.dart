// import 'dart:io';
// import 'dart:convert';
// import 'package:path_provider/path_provider.dart';
// import 'package:weather_forecast_app/data_handling/serialisator/cities.dart';

import 'package:flutter/material.dart';
import 'package:weather_forecast_app/screens/home_screen/home_screen.dart';
import 'package:weather_forecast_app/screens/settings_screen/settings_screen.dart';

void main() async {
  // // получаем расположение дефолтной директории файлов программы
  // Directory appDirectory = await getApplicationDocumentsDirectory();
  // String appDirectoryPath = appDirectory.path;

  // // формируем путь к файлу который нас интересует
  // // и создаём объект == самому файлу
  // final favouriteCitiesFilePath = '$appDirectoryPath/favourite_cities.json';
  // final favouriteCitiesFile = File(favouriteCitiesFilePath);

  // // если файла нет, он создаётся с дефолтным городом МОСКАВА
  // if (!await favouriteCitiesFile.exists()) {
  //   FavouriteCitiesData initialData = FavouriteCitiesData(
  //     selectedCity: 0,
  //     favouriteCities: [
  //       City(
  //         name: "Moscow",
  //         country: "RU",
  //         location: Location(lon: "37.615555", lat: "55.75222"),
  //       ),
  //     ],
  //   );
  //   // записываем в файл
  //   await favouriteCitiesFile.writeAsString(jsonEncode(initialData));
  //   debugPrint('File created with initial data: $initialData');
  // }

  // // Подтягиваем инфу по выбранному и избранным городам в приложение
  // final FavouriteCitiesData? favouriteCities =
  //     await readFavouriteCitiesData(favouriteCitiesFile);

  runApp(
    MaterialApp(
      title: 'Weather forecast',
      initialRoute: '/settings',
      routes: {
        // '/home': (context) => HomeScreen(cities: favouriteCities),
        '/home': (context) => const HomeScreen(),
        '/settings': (context) => const SettingsScreen(),
      },
    ),
  );
}

// Future<FavouriteCitiesData?> readFavouriteCitiesData(
//     File favouriteCitiesFile) async {
//   try {
//     // считываем файл и записываем его в строку
//     // вызываем метод преобразующий ключи в объект
//     final String data = await favouriteCitiesFile.readAsString();
//     final Map<String, dynamic> jsonData = jsonDecode(data);
//     return FavouriteCitiesData.fromJson(jsonData);
//   } catch (exeption) {
//     debugPrint('Ошибка при чтении файла: $exeption');
//     return null;
//   }
// }


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
//   "selectedCity": 0
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