import 'dart:convert';

import 'package:weather_forecast_app/api%20and%20json/answer.dart';

// Создаём класс, хранящий необходимые ключи из ответа сервера
class WeatherInfo {
  final int date;
  final double latitude;
  final double longitude;
  final String timezone;
  final int timezoneOffset;
  final int pressure;
  final double temperature;
  final int weatherId;

  WeatherInfo({
    required this.date,
    required this.latitude,
    required this.longitude,
    required this.timezone,
    required this.timezoneOffset,
    required this.pressure,
    required this.temperature,
    required this.weatherId,
  });

  // Фабричный метод преобразования строки в объекты класса
  factory WeatherInfo.fromJson(Map<String, dynamic> json) {
    // появилась вложенность объекта/класса в ответе от сервера  - будь добр ПАРСЬ...
    final currentData = json['current'] as Map<String, dynamic>;
    // При парсе глубинно-вложенных вещей, парсь с передачей объекта (уровня + 1)
    // так как в ответе weather это строка то мы работаем дополнительно с индексами объектов
    final weatherData = currentData['weather'][0] as Map<String, dynamic>;

    return WeatherInfo(
      latitude: json["lat"] as double,
      longitude: json["lon"] as double,
      timezone: json["timezone"] as String,
      timezoneOffset: json["timezone_offset"] as int,
      date: currentData["dt"] as int,
      pressure: currentData["pressure"] as int,
      temperature: currentData["temp"] as double,
      weatherId: weatherData["id"] as int,
    );
  }
}

// Распарсить JSON
void decodeJson() {
  // 1 способ --фактори (фабричный/заводской подготовки)
  final jsonData = jsonDecode(jsonString);

  // Вызываем метод класса WeatherInfo, и записываем возвращающийся результат
  // в переменную типа WeatherInfo
  final weatherInfo = WeatherInfo.fromJson(jsonData);

  // И уже отсюда получаем значения необходимые для "жизни"...
  final latitude = weatherInfo.latitude;
  final longitude = weatherInfo.longitude;
  final weatherId = weatherInfo.weatherId;
  // Для получения актуальной инфы по выбранному городу необходимо просуммировать
  // вместе с смещением часового пояса
  final date = weatherInfo.date + weatherInfo.timezoneOffset;
  final temperature = weatherInfo.temperature;

  // Принтуем в консоль чтобы убедиться в роботоспособности
  print('Широта: $latitude');
  print('Долгота: $longitude');
  print('Долгота: $weatherId');
  print('temperature: $temperature');

  // Преобразование Unix timestamp в объект DateTime
  // Из числа получаем текущее время
  DateTime dateTime =
      DateTime.fromMillisecondsSinceEpoch(date * 1000, isUtc: true);

  // Вывод значения на экран в человеко-читаемом формате
  print('Значение ключа "dt": ${dateTime.toLocal()}');
}

// 2 способ
// считывается строка ДЖСОН, затем просто мануально обращаемся копируем всё тудым-судым
/*
final jsonData = jsonDecode(jsonString);
// Получить широту и долготу
final latitude = jsonData['lat'];
final longitude = jsonData['lon'];

// Выводим результат
print('Широта: $latitude');
print('Долгота: $longitude');
*/