import 'dart:convert';
import 'dart:io';

import 'package:weather_forecast_app/data_handling/weather_data.dart';

// Ручная сборка URI
/*
  Uri url = Uri(
    scheme: "https",
    host: "api.openweathermap.org",
    path: "data/2.5/onecall?lat=54.3282&lon=48.3866",
    queryParameters: {
      'lat': '54.3282',
      'lon': '48.3866',
      'lang': 'ru',
      'units': 'metric',
      'exclude': 'alerts,minutely,hourly',
      'appid': '6f6f192517f2b62b4364d19778420b76',
    },
  );
*/
const String urlRequest =
    'https://api.openweathermap.org/data/2.5/onecall?lat=54.3282&lon=48.3866&lang=ru&units=metric&exclude=alerts,minutely,hourly&appid=6f6f192517f2b62b4364d19778420b76';

class ApiClient {
  final apiClient = HttpClient();

  // Возвращаем из метода строку ответа / null
  Future<String?> getWeatherInfoAsResponseString() async {
    Uri url = Uri.parse(urlRequest);

    try {
      final request = await apiClient.getUrl(url); // отправка запроса
      final response = await request.close(); // ожидание ответа

      if (response.statusCode != 200) {
        print('Ошибка при работе с сервером: err = ${response.statusCode}');
        return null;
      } else {
        // Приведение к формату UTF8
        final responseString =
            await response.transform(const Utf8Decoder()).join();
        return responseString;
      }
    } catch (exeption) {
      print('Произошла ошибка: $exeption');
      return null;
    }
  }

// Возвращаем из метода экземпляр класса WeatherData, хранящий свойства ответа по ключам
// WeatherData actualWeatherData = ApiClient.getWeatherInfo();
// actualWeatherData.current.visibility.ToString();
  Future<WeatherData?> getWeatherInfoAsObject() async {
    Uri url = Uri.parse(urlRequest);
    try {
      final request = await apiClient.getUrl(url); // отправка запроса
      final response = await request.close(); // ожидание ответа

      if (response.statusCode != 200) {
        print('Ошибка при работе с сервером: err = ${response.statusCode}');
        return null;
      } else {
        // Приведение к формату UTF8
        final responseString =
            await response.transform(const Utf8Decoder()).join();

        // print(responseString);

        // библиотечный метод преобразования строки типа json
        final jsonData = jsonDecode(responseString);
        // Вызываем метод класса WeatherInfo, и записываем возвращающийся результат
        // в переменную типа WeatherInfo
        final weatherData = WeatherData.fromJson(jsonData);
        return weatherData;
      }
    } catch (exeption) {
      print('Произошла ошибка: $exeption');
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
      print('Ошибка при работе с сервером: err = ${response.statusCode}');
      // return 0;
    } else {
      final responseStrings =
          await response.transform(const Utf8Decoder()).toList();
      final responseString = responseStrings.join();

      // print(responseString);

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
      print('date: $date');
      print('timezoneOffset: $timezoneOffset');
      print('humidity: $humidity');
      print('pressure: $pressure');
      print('temperature: $temperature');
      print('temperatureMin: $temperatureMin');
      print('temperatureMax: $temperatureMax');
      print('temperatureFilsLike: $temperatureFilsLike');
      print('visibility: $visibility');
      print('windSpeed: $windSpeed');
    }
  }
*/
