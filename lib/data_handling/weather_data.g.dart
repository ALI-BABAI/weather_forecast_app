// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'weather_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

WeatherData _$WeatherDataFromJson(Map<String, dynamic> json) => WeatherData(
      timezoneOffset: json['timezone_offset'] as int,
      current: Current.fromJson(json['current'] as Map<String, dynamic>),
      daily: (json['daily'] as List<dynamic>)
          .map((e) => Daily.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$WeatherDataToJson(WeatherData instance) =>
    <String, dynamic>{
      'timezone_offset': instance.timezoneOffset,
      'current': instance.current,
      'daily': instance.daily,
    };

Current _$CurrentFromJson(Map<String, dynamic> json) => Current(
      date: json['dt'] as int,
      temperature: (json['temp'] as num).toDouble(),
      temperatureFillsLike: (json['feels_like'] as num).toDouble(),
      pressure: json['pressure'] as int,
      humidity: json['humidity'] as int,
      visibility: json['visibility'] as int,
      windSpeed: (json['wind_speed'] as num).toDouble(),
    );

Map<String, dynamic> _$CurrentToJson(Current instance) => <String, dynamic>{
      'dt': instance.date,
      'temp': instance.temperature,
      'feels_like': instance.temperatureFillsLike,
      'pressure': instance.pressure,
      'humidity': instance.humidity,
      'visibility': instance.visibility,
      'wind_speed': instance.windSpeed,
    };

Daily _$DailyFromJson(Map<String, dynamic> json) => Daily(
      date: json['dt'] as int,
      pressure: json['pressure'] as int,
      humidity: json['humidity'] as int,
      windSpeed: (json['wind_speed'] as num).toDouble(),
      dailyTemperature:
          DailyTemperature.fromJson(json['temp'] as Map<String, dynamic>),
      dailyFillsLike:
          DailyFillsLike.fromJson(json['feels_like'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$DailyToJson(Daily instance) => <String, dynamic>{
      'dt': instance.date,
      'pressure': instance.pressure,
      'humidity': instance.humidity,
      'wind_speed': instance.windSpeed,
      'temp': instance.dailyTemperature,
      'feels_like': instance.dailyFillsLike,
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
