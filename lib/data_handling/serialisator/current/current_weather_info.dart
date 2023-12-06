import 'package:json_annotation/json_annotation.dart';
import 'package:weather_forecast_app/data_handling/serialisator/general_key/weather.dart';

part 'current_weather_info.g.dart'; 


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
  final List<Weather> weather;

  Current({
    required this.date,
    required this.temperature,
    required this.temperatureFillsLike,
    required this.pressure,
    required this.humidity,
    required this.visibility,
    required this.windSpeed,
    required this.weather,
  });
  // конвертация из гсона в класс
  factory Current.fromJson(Map<String, dynamic> json) =>
      _$CurrentFromJson(json);

  // конвертация из сгенирированных данных в джсон
  Map<String, dynamic> toJson() => _$CurrentToJson(this);
}