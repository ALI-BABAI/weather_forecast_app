import 'package:json_annotation/json_annotation.dart';
import 'package:weather_forecast_app/data_handling/network/serialisator/weather/general_key/weather.dart';

part 'hourly_weather_info.g.dart'; 

@JsonSerializable()
class Hourly {
  @JsonKey(name: 'dt')
  final int date;
  @JsonKey(name: 'temp')
  final double temperature;
  final List<Weather> weather;

  Hourly({
    required this.date,
    required this.temperature,
    required this.weather,
  });
  factory Hourly.fromJson(Map<String, dynamic> json) => _$HourlyFromJson(json);
  Map<String, dynamic> toJson() => _$HourlyToJson(this);
}