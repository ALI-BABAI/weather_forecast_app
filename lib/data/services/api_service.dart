import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';

import 'package:http/http.dart' as http;
import 'package:weather_forecast_app/domain/models/weather_model.dart';

enum ApiExeptionType {
  network, // отсутствие интернета у пользователя
  overlimit,
  other,
}

class ApiClientExeption implements Exception {
  final ApiExeptionType type;

  ApiClientExeption({required this.type});
}

class ApiService {
  Future<WeatherModel> getWeather({
    double lat = 54.27028,
    double lon = 48.302364,
  }) async {
    final apiClient = http.Client();
    Uri url = Uri(
      scheme: "https",
      host: "api.openweathermap.org",
      path: "data/2.5/onecall",
      queryParameters: {
        'lat': lat.toString(),
        'lon': lon.toString(),
        'units': 'metric',
        'exclude': 'alerts,minutely',
        'appid': '6f6f192517f2b62b4364d19778420b76',
      },
    );
    try {
      final response = await apiClient.get(url);
      if (response.statusCode == 429) {
        debugPrint(
            'Ошибка: Превышен лимит запросов к серверу. statusCode = ${response.statusCode}');
        throw ApiClientExeption(type: ApiExeptionType.overlimit);
      }
      if (response.statusCode != 200) {
        debugPrint(
            'Ошибка при работе с сервером. statusCode = ${response.statusCode}');
        throw ApiClientExeption(type: ApiExeptionType.other);
      }
      final jsonData = jsonDecode(response.body);
      final weatherData = WeatherModel.fromJson(jsonData);
      return weatherData;
    } on SocketException {
      throw ApiClientExeption(type: ApiExeptionType.network);
    } catch (error) {
      debugPrint('Произошла ошибка: $error');
      rethrow;
    } finally {
      apiClient.close();
    }
  }

// // Возвращает список объектов типа WeatherData, хранящий информацию
// // по погоде во всех сохранённых городах
//   Future<List<WeatherModel>> getWeatherInfoForSavedCities(
//       {required SavedCities savedCities}) async {
//     List<WeatherModel> weatherDataList = [];
//     try {
//       for (final city in savedCities.citiesList) {
//         final weatherData = await getWeatherInfoAsObject(
//           lat: city.lat,
//           lon: city.lon,
//         );
//         weatherDataList.add(weatherData!);
//       }
//       return weatherDataList;
//     } catch (error) {
//       if (error is ApiClientExeption) {
//         switch (error.type) {
//           case ApiExeptionType.network:
//             debugPrint('Ошибка: Отсутствует подключение к сети');
//             throw ApiClientExeption(type: ApiExeptionType.network);
//           case ApiExeptionType.overlimit:
//             debugPrint('Ошибка: Превышен лимит запросов к серверу');
//             throw ApiClientExeption(type: ApiExeptionType.overlimit);
//           case ApiExeptionType.other:
//             debugPrint('Произошла ошибка: $error');
//             throw ApiClientExeption(type: ApiExeptionType.other);
//         }
//       } else {
//         // Обработка других ошибок
//         debugPrint('Произошла ошибка: $error');
//         throw ApiClientExeption(type: ApiExeptionType.other);
//       }
//     }
//   }
}
