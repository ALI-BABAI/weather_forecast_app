
import 'package:json_annotation/json_annotation.dart';
import 'package:weather_forecast_app/data_handling/serialisator/general_key/weather.dart';

part 'daily_weather_info.g.dart'; 


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
  final List<Weather> weather;

  Daily({
    required this.date,
    required this.pressure,
    required this.humidity,
    required this.windSpeed,
    required this.dailyTemperature,
    required this.dailyFillsLike,
    required this.weather,
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

