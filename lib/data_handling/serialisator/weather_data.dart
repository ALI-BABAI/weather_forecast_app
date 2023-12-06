import 'package:json_annotation/json_annotation.dart';

import 'current/current_weather_info.dart';
import 'daily/daily_weather_info.dart';
import 'hourly/hourly_weather_info.dart';

part 'weather_data.g.dart';


// наличие ошибок (3х) является нормой. нужно сгенериться дать файлу
// Аввада-кедавра которую нужно ввести в терминале:

// dart run build_runner build   // dart run build_runner watch

// Для правильной работы сей прекрасного инструмента как <сериализатор>*
// Необходимо реализовать для каждого объекта класса свой собственный генератор*

// Признак для автосборщика чтоб он "творил"
@JsonSerializable()
class WeatherData {
  // Передаёт автосборщику инструкцию о привязке данных из ключа в переменную timezoneOffset
  @JsonKey(name: 'timezone_offset')
  final int timezoneOffset;
  final Current current; // объект содержащий в себя свои вложеные ключи
  final List<Hourly> hourly; // квадратные скобки в ответе == списко объектов
  final List<Daily> daily; // квадратные скобки в ответе == списко объектов

  WeatherData({
    required this.timezoneOffset,
    required this.current,
    required this.hourly,
    required this.daily,
  });
  // конвертация из гсона в класс
  factory WeatherData.fromJson(Map<String, dynamic> json) =>
      _$WeatherDataFromJson(json);

  // конвертация из сгенирированных данных в джсон
  Map<String, dynamic> toJson() => _$WeatherDataToJson(this);
}
