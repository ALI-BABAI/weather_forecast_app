// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'example_json_serializable.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

WeatherInfoSerializable _$WeatherInfoSerializableFromJson(
        Map<String, dynamic> json) =>
    WeatherInfoSerializable(
      timezoneOffset: json['timezone_offset'] as int,
      pressure: json['pressure'] as int,
      weatherId: json['id'] as int,
    );

Map<String, dynamic> _$WeatherInfoSerializableToJson(
        WeatherInfoSerializable instance) =>
    <String, dynamic>{
      'timezone_offset': instance.timezoneOffset,
      'pressure': instance.pressure,
      'id': instance.weatherId,
    };
