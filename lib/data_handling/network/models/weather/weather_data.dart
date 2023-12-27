// import 'package:json_annotation/json_annotation.dart';

// import 'current/current_weather_info.dart';
// import 'daily/daily_weather_info.dart';
// import 'hourly/hourly_weather_info.dart';

// part 'weather_data.g.dart';

// // dart run build_runner build   // dart run build_runner watch

// @JsonSerializable()
// class WeatherData {
//   // Передача автосборщику инструкции о привязке данных из ключа('timezone_offset') в timezoneOffset
//   @JsonKey(name: 'timezone_offset')
//   final int timezoneOffset;
//   final Current current;
//   final List<Hourly> hourly;
//   final List<Daily> daily;

//   WeatherData({
//     required this.timezoneOffset,
//     required this.current,
//     required this.hourly,
//     required this.daily,
//   });
//   // преобразование json-ответа в объект типа WeatherData
//   factory WeatherData.fromJson(Map<String, dynamic> json) =>
//       _$WeatherDataFromJson(json);

//   // Преобразование объекта в json формат
//   Map<String, dynamic> toJson() => _$WeatherDataToJson(this);
// }