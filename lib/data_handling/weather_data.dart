import 'package:json_annotation/json_annotation.dart';

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
  final List<Daily> daily; // квадратные скобки в ответе == списко объектов

  WeatherData({
    required this.timezoneOffset,
    required this.current,
    required this.daily,
  });
  // конвертация из гсона в класс
  factory WeatherData.fromJson(Map<String, dynamic> json) =>
      _$WeatherDataFromJson(json);

  // конвертация из сгенирированных данных в джсон
  Map<String, dynamic> toJson() => _$WeatherDataToJson(this);
}

@JsonSerializable()
class Current {
  @JsonKey(name: 'dt')
  final int date;
  @JsonKey(name: 'temp')
  final double temperature;
  @JsonKey(name: 'feels_like')
  final double temperatureFillsLike;
  final int pressure;
  final int humidity;
  final int visibility;
  @JsonKey(name: 'wind_speed')
  final double windSpeed;

  Current({
    required this.date,
    required this.temperature,
    required this.temperatureFillsLike,
    required this.pressure,
    required this.humidity,
    required this.visibility,
    required this.windSpeed,
  });
  // конвертация из гсона в класс
  factory Current.fromJson(Map<String, dynamic> json) =>
      _$CurrentFromJson(json);

  // конвертация из сгенирированных данных в джсон
  Map<String, dynamic> toJson() => _$CurrentToJson(this);
}

@JsonSerializable()
class Daily {
  @JsonKey(name: 'dt')
  final int date;
  final int pressure;
  final int humidity;
  @JsonKey(name: 'wind_speed')
  final double windSpeed;
  @JsonKey(name: 'temp')
  final DailyTemperature dailyTemperature;
  @JsonKey(name: 'feels_like')
  final DailyFillsLike dailyFillsLike;

  Daily({
    required this.date,
    required this.pressure,
    required this.humidity,
    required this.windSpeed,
    required this.dailyTemperature,
    required this.dailyFillsLike,
  });
  // конвертация из гсона в класс
  factory Daily.fromJson(Map<String, dynamic> json) => _$DailyFromJson(json);
  // конвертация из сгенирированных данных в джсон
  Map<String, dynamic> toJson() => _$DailyToJson(this);
}

@JsonSerializable()
class DailyTemperature {
  final double day;
  final double min;
  final double max;
  final double night;
  final double eve;
  final double morn;

  DailyTemperature({
    required this.day,
    required this.min,
    required this.max,
    required this.night,
    required this.eve,
    required this.morn,
  });
  // конвертация из гсона в класс
  factory DailyTemperature.fromJson(Map<String, dynamic> json) =>
      _$DailyTemperatureFromJson(json);

  // конвертация из сгенирированных данных в джсон
  Map<String, dynamic> toJson() => _$DailyTemperatureToJson(this);
}

@JsonSerializable()
class DailyFillsLike {
  final double day;
  final double night;
  final double eve;
  final double morn;

  DailyFillsLike({
    required this.day,
    required this.night,
    required this.eve,
    required this.morn,
  });
  // конвертация из гсона в класс
  factory DailyFillsLike.fromJson(Map<String, dynamic> json) =>
      _$DailyFillsLikeFromJson(json);

  // конвертация из сгенирированных данных в джсон
  Map<String, dynamic> toJson() => _$DailyFillsLikeToJson(this);
}
