// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'weather.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Weather _$WeatherFromJson(Map<String, dynamic> json) => Weather(
      weatherLogo: json['main'] as String,
      description: json['description'] as String,
      id: json['id'] as int,
    );

Map<String, dynamic> _$WeatherToJson(Weather instance) => <String, dynamic>{
      'main': instance.weatherLogo,
      'description': instance.description,
      'id': instance.id,
    };