import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:weather_forecast_app/repositories/network/models/weather_model.dart';
import 'package:weather_forecast_app/main.dart';

enum ApiExeptionType {
  network, // отсутствие интернета у пользователя
  overlimit,
  other,
}

class ApiClientExeption implements Exception {
  final ApiExeptionType type;

  ApiClientExeption({required this.type});
}

class ApiClient {
  final _apiClient = HttpClient();

// Возвращаем из метода объект типа WeatherData, хранящий информацию о погоде по переданным координатам
  Future<WeatherModel?> getWeatherInfoAsObject(
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
      final request = await _apiClient.getUrl(url); // отправка запроса
      final response = await request.close(); // ожидание ответа
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
      // Приведение к формату UTF8
      final responseString =
          await response.transform(const Utf8Decoder()).join();
      // библиотечный метод преобразования строки типа json
      final jsonData = jsonDecode(responseString);
      // Вызываем метод класса WeatherInfo, и записываем результат  в переменную типа WeatherInfo
      final weatherData = WeatherModel.fromJson(jsonData);
      return weatherData;
    } on SocketException {
      throw ApiClientExeption(type: ApiExeptionType.network);
    } catch (error) {
      debugPrint('Произошла ошибка: $error');
      rethrow;
    }
  }

// Возвращает список объектов типа WeatherData, хранящий информацию
// по погоде во всех сохранённых городах
  Future<List<WeatherModel?>?> getWeatherInfoForSavedCities() async {
    List<WeatherModel?> weatherDataList = [];
    try {
      for (final city in savedCitiesData!.citiesList) {
        final weatherData = await getWeatherInfoAsObject(
          lat: city.lat,
          lon: city.lon,
        );
        weatherDataList.add(weatherData);
      }
      return weatherDataList;
    } catch (error) {
      if (error is ApiClientExeption) {
        switch (error.type) {
          case ApiExeptionType.network:
            debugPrint('Ошибка: Отсутствует подключение к сети');
            throw ApiClientExeption(type: ApiExeptionType.network);
          case ApiExeptionType.overlimit:
            debugPrint('Ошибка: Превышен лимит запросов к серверу');
            throw ApiClientExeption(type: ApiExeptionType.overlimit);
          case ApiExeptionType.other:
            debugPrint('Произошла ошибка: $error');
            throw ApiClientExeption(type: ApiExeptionType.other);
        }
      } else {
        // Обработка других ошибок
        debugPrint('Произошла ошибка: $error');
        throw ApiClientExeption(type: ApiExeptionType.other);
      }
    }
  }
}
// await Future.delayed(const Duration(seconds: 0));
