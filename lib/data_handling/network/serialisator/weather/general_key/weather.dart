import 'package:json_annotation/json_annotation.dart';

part 'weather.g.dart'; 

@JsonSerializable()
class Weather {
  @JsonKey(name: 'main')
  final String weatherLogo;
  final String description;

  Weather({
    required this.weatherLogo,
    required this.description,
  });
  factory Weather.fromJson(Map<String, dynamic> json) =>
      _$WeatherFromJson(json);
  Map<String, dynamic> toJson() => _$WeatherToJson(this);
}