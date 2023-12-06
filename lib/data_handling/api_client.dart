import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:weather_forecast_app/data_handling/serialisator/cities.dart';
import 'serialisator/weather_data.dart';

const String urlRequest =
    'https://api.openweathermap.org/data/2.5/onecall?lat=54.244549&lon=48.31618&units=metric&exclude=minutely,alerts&appid=6f6f192517f2b62b4364d19778420b76';
// Uri url = Uri.parse(urlRequest);

class ApiClient {
  final apiClient = HttpClient();

  // Возвращаем из метода строку ответа / null
  Future<String?> getWeatherInfoAsResponseString() async {
    Uri url = Uri.parse(urlRequest);

    try {
      final request = await apiClient.getUrl(url); // отправка запроса
      final response = await request.close(); // ожидание ответа

      if (response.statusCode != 200) {
        debugPrint(
            'Ошибка при работе с сервером: err = ${response.statusCode}');
        return null;
      } else {
        // Приведение к формату UTF8
        final responseString =
            await response.transform(const Utf8Decoder()).join();
        return responseString;
      }
    } catch (exeption) {
      debugPrint('Произошла ошибка: $exeption');
      return null;
    }
  }

// Возвращаем из метода экземпляр класса WeatherData, хранящий свойства ответа по ключам
// WeatherData actualWeatherData = ApiClient.getWeatherInfo();
// actualWeatherData.current.visibility.ToString();
  Future<WeatherData?> getWeatherInfoAsObject() async {
    await Future.delayed(const Duration(seconds: 2));
    
    //final citiesList = City.fromJson(jsonData);
    
    // Ручная сборка URI
    Uri url = Uri(
      scheme: "https",
      host: "api.openweathermap.org",
      path: "data/2.5/onecall",
      queryParameters: {
        'lat': '54.3282',
        'lon': '48.3866',
        'units': 'metric',
        'exclude': 'alerts,minutely',
        'appid': '6f6f192517f2b62b4364d19778420b76',
      },
    );
    try {
      final request = await apiClient.getUrl(url); // отправка запроса
      final response = await request.close(); // ожидание ответа

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
      // Вызываем метод класса WeatherInfo, и записываем возвращающийся результат
      // в переменную типа WeatherInfo
      final weatherData = WeatherData.fromJson(jsonData);
      return weatherData;
    } catch (exeption) {
      debugPrint('Произошла ошибка: $exeption');
      return null;
    }
  }
}

/*
 void getWeatherInfokek() async {
    Uri url = Uri.parse(urlRequest);

    final request = await apiClietn.getUrl(url); // отправка запроса
    final response = await request.close(); // ожидание ответа

    if (response.statusCode != 200) {
      debugPrint('Ошибка при работе с сервером: err = ${response.statusCode}');
      // return 0;
    } else {
      final responseStrings =
          await response.transform(const Utf8Decoder()).toList();
      final responseString = responseStrings.join();

      // debugPrint(responseString);

      // библиотечный метод преобразования строки типа json
      final jsonData = jsonDecode(responseString);
      // Вызываем метод класса WeatherInfo, и записываем возвращающийся результат
      // в переменную типа WeatherInfo
      final weatherData = WeatherData.fromJson(jsonData);

      // Полагаю, правильно было бы ретёрнить weatherData и уже с этим всюду работать.
      // другой файл...
      // WeatherData actualWeatherData = ApiClient.getWeatherInfo();
      //  WeatherParameter(
      //   name: 'visibility: ',
      //   info: '10km',            // actualWeatherData.current.visibility.ToString();
      //   icon: Icons.visibility_outlined,
      //   ),

      // И уже отсюда получаем значения необходимые для "жизни"...
      final date = weatherData.current.date;
      final timezoneOffset = weatherData.timezoneOffset;
      final humidity = weatherData.current.humidity;
      final pressure = weatherData.current.pressure;
      final temperature = weatherData.current.temperature;
      final temperatureMin = weatherData.daily.first.dailyTemperature.min;
      final temperatureMax = weatherData.daily.first.dailyTemperature.max;
      final temperatureFilsLike = weatherData.current.temperatureFillsLike;
      final visibility = weatherData.current.visibility;
      final windSpeed = weatherData.current.windSpeed;

      // Выводим результат в консоль
      debugPrint('date: $date');
      debugPrint('timezoneOffset: $timezoneOffset');
      debugPrint('humidity: $humidity');
      debugPrint('pressure: $pressure');
      debugPrint('temperature: $temperature');
      debugPrint('temperatureMin: $temperatureMin');
      debugPrint('temperatureMax: $temperatureMax');
      debugPrint('temperatureFilsLike: $temperatureFilsLike');
      debugPrint('visibility: $visibility');
      debugPrint('windSpeed: $windSpeed');
    }
  }
*/
