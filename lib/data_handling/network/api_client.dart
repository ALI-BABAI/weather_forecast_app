import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:weather_forecast_app/data_handling/network/serialisator/weather/weather_data.dart';
import 'package:weather_forecast_app/main.dart';

class ApiClient {
  final apiClient = HttpClient();

// Возвращаем из метода объект типа WeatherData, хранящий информацию о погоде по переданным координатам
  Future<WeatherData?> getWeatherInfoAsObject(
      {double lat = 54.27028, double lon = 48.302364}) async {
    // Ручная сборка URI
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
      final request = await apiClient.getUrl(url); // отправка запроса
      final response = await request.close(); // ожидание ответа

      if (response.statusCode == 429) {
        debugPrint(
            'Превышено количество запросов к серверу = ${response.statusCode}');
        return null;
      }

      if (response.statusCode != 200) {
        debugPrint(
            'Ошибка при работе с сервером: err = ${response.statusCode}');
        return null;
      }

      // Приведение к формату UTF8
      final responseString =
          await response.transform(const Utf8Decoder()).join();

      // библиотечный метод преобразования строки типа json
      final jsonData = jsonDecode(responseString);
      // Вызываем метод класса WeatherInfo, и записываем результат  в переменную типа WeatherInfo
      final weatherData = WeatherData.fromJson(jsonData);
      return weatherData;
    } catch (exeption) {
      debugPrint('Произошла ошибка: $exeption');
      return null;
    }
  }

// Возвращает список объектов типа WeatherData, хранящий информацию
// по погоде во всех сохранённых городах
  Future<List<WeatherData?>> getWeatherInfoForSavedCities() async {
    List<WeatherData?> weatherDataList = [];

    for (final city in savedCitiesData!.favouriteCities) {
      final weatherData = await getWeatherInfoAsObject(
        lat: city.location.lat,
        lon: city.location.lon,
      );
      weatherDataList.add(weatherData);
    }
    return weatherDataList;
  }
}

// await Future.delayed(const Duration(seconds: 0));