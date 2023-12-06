// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'daily_weather_info.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Daily _$DailyFromJson(Map<String, dynamic> json) => Daily(
      date: json['dt'] as int,
      pressure: json['pressure'] as int,
      humidity: json['humidity'] as int,
      windSpeed: (json['wind_speed'] as num).toDouble(),
      dailyTemperature:
          DailyTemperature.fromJson(json['temp'] as Map<String, dynamic>),
      dailyFillsLike:
          DailyFillsLike.fromJson(json['feels_like'] as Map<String, dynamic>),
      weather: (json['weather'] as List<dynamic>)
          .map((e) => Weather.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$DailyToJson(Daily instance) => <String, dynamic>{
      'dt': instance.date,
      'pressure': instance.pressure,
      'humidity': instance.humidity,
      'wind_speed': instance.windSpeed,
      'temp': instance.dailyTemperature,
      'feels_like': instance.dailyFillsLike,
      'weather': instance.weather,
    };

DailyTemperature _$DailyTemperatureFromJson(Map<String, dynamic> json) =>
    DailyTemperature(
      day: (json['day'] as num).toDouble(),
      min: (json['min'] as num).toDouble(),
      max: (json['max'] as num).toDouble(),
      night: (json['night'] as num).toDouble(),
      eve: (json['eve'] as num).toDouble(),
      morn: (json['morn'] as num).toDouble(),
    );

Map<String, dynamic> _$DailyTemperatureToJson(DailyTemperature instance) =>
    <String, dynamic>{
      'day': instance.day,
      'min': instance.min,
      'max': instance.max,
      'night': instance.night,
      'eve': instance.eve,
      'morn': instance.morn,
    };

DailyFillsLike _$DailyFillsLikeFromJson(Map<String, dynamic> json) =>
    DailyFillsLike(
      day: (json['day'] as num).toDouble(),
      night: (json['night'] as num).toDouble(),
      eve: (json['eve'] as num).toDouble(),
      morn: (json['morn'] as num).toDouble(),
    );

Map<String, dynamic> _$DailyFillsLikeToJson(DailyFillsLike instance) =>
    <String, dynamic>{
      'day': instance.day,
      'night': instance.night,
      'eve': instance.eve,
      'morn': instance.morn,
    };
