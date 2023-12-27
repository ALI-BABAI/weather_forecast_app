import 'package:weather_forecast_app/data_handling/network/models/build_in_models/daily.dart';
import 'package:weather_forecast_app/data_handling/network/models/build_in_models/hourly.dart';

class WeatherModel {
  final int timezoneOffset;
  final int date;
  final int temperature;
  final int temperatureFillsLike;
  final int pressure;
  final int humidity;
  final double visibility;
  final double wind;
  final String description;
  final int iconID;
  // build-in-model's
  final List<Hourly> hourly;
  final List<Daily> daily;

  WeatherModel({
    required this.date,
    required this.timezoneOffset,
    required this.temperature,
    required this.temperatureFillsLike,
    required this.pressure,
    required this.humidity,
    required this.visibility,
    required this.wind,
    required this.description,
    required this.iconID,
    required this.hourly,
    required this.daily,
  });

  factory WeatherModel.fromJson(Map<String, dynamic> json) {
    return WeatherModel(
      timezoneOffset: json['timezone_offset'],
      date: json['current']['dt'].toInt(),
      temperature: json['current']['temp'].round().toInt(),
      temperatureFillsLike: json['current']['feels_like'].round().toInt(),
      pressure: json['current']['pressure'],
      humidity: json['current']['humidity'],
      visibility: json['current']['visibility'] / 1000,
      wind: json['current']['wind_speed'].toDouble(),
      description: json['current']['weather'][0]['description'],
      iconID: json['current']['weather'][0]['id'],
      hourly: (json['hourly'] as List<dynamic>)
          .map((e) => Hourly.fromJSON(e as Map<String, dynamic>))
          .toList(),
      daily: (json['daily'] as List<dynamic>)
          .map((e) => Daily.fromJSON(e as Map<String, dynamic>))
          .toList(),
    );
  }
}
