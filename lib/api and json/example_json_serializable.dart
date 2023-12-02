// тут ошибочка.
// используется не автосгенерированные переменные, а тож самое что в файле
// example_json.dart --> мануальный метод

import 'dart:convert';
import 'package:json_annotation/json_annotation.dart';
import 'package:weather_forecast_app/api%20and%20json/answer.dart';
import 'package:weather_forecast_app/api%20and%20json/example_json.dart';

// наличие ошибок (3х) является нормой. нужно сгенериться дать файлу
// Аввада-кедавра которую нужно ввести в терминале:

// dart run build_runner build   // dart run build_runner watch

part 'example_json_serializable.g.dart';

@JsonSerializable()
class WeatherInfoSerializable {
  // Передаёт автосборщику инструкцию о привязке данных из ключа в переменную timezoneOffset
  @JsonKey(name: 'timezone_offset')
  final int timezoneOffset;
  final int pressure;
  @JsonKey(name: 'id')
  final int weatherId;

  WeatherInfoSerializable(
      {required this.timezoneOffset,
      required this.pressure,
      required this.weatherId});

  // Автоконвертация из гсона в класс
  factory WeatherInfoSerializable.fromJson(Map<String, dynamic> json) =>
      _$WeatherInfoSerializableFromJson(json);

  // конвертация из сгенирированных данных в джсон
  Map<String, dynamic> toJson() => _$WeatherInfoSerializableToJson(this);
}

// Парсинг JSONа
void decodeJsonSerializable() {
  // 1 способ --фактори (фабричный/заводской подготовки)
  final jsonData = jsonDecode(jsonString);

  // Вызываем метод класса WeatherInfo, и записываем возвращающийся результат
  // в переменную типа WeatherInfo
  final weatherInfo = WeatherInfo.fromJson(jsonData);

  // Получить широту и долготу из экземпляра WeatherInfo
  final latitude = weatherInfo.latitude;
  final longitude = weatherInfo.longitude;
  final weatherId = weatherInfo.weatherId;

  // Вывести результат
  print('Широта Serializable: $latitude');
  print('Долгота Serializable: $longitude');
  print('id Serializable: $weatherId');
}
