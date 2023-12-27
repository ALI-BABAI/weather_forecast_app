// // GENERATED CODE - DO NOT MODIFY BY HAND

// part of 'current_weather_info.dart';

// // **************************************************************************
// // JsonSerializableGenerator
// // **************************************************************************

// Current _$CurrentFromJson(Map<String, dynamic> json) => Current(
//       date: json['dt'] as int,
//       temperature: (json['temp'] as num).toDouble(),
//       temperatureFillsLike: (json['feels_like'] as num).toDouble(),
//       pressure: json['pressure'] as int,
//       humidity: json['humidity'] as int,
//       visibility: json['visibility'] as int,
//       windSpeed: (json['wind_speed'] as num).toDouble(),
//       weather: (json['weather'] as List<dynamic>)
//           .map((e) => Weather.fromJson(e as Map<String, dynamic>))
//           .toList(),
//     );

// Map<String, dynamic> _$CurrentToJson(Current instance) => <String, dynamic>{
//       'dt': instance.date,
//       'temp': instance.temperature,
//       'feels_like': instance.temperatureFillsLike,
//       'pressure': instance.pressure,
//       'humidity': instance.humidity,
//       'visibility': instance.visibility,
//       'wind_speed': instance.windSpeed,
//       'weather': instance.weather,
//     };
