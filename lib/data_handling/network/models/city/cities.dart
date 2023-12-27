// import 'package:json_annotation/json_annotation.dart';

// part 'cities.g.dart';

// // dart run build_runner build   // dart run build_runner watch

// @JsonSerializable()
// class ApiCity {
//   final String name;
//   final String country;
//   // Передача автосборщику инструкции о привязке данных из ключа('coord') в location
//   @JsonKey(name: 'coord')
//   final Location location;

//   ApiCity({
//     required this.name,
//     required this.country,
//     required this.location,
//   });
//   // преобразование json-ответа в объект типа ApiCity
//   factory ApiCity.fromJson(Map<String, dynamic> json) =>
//       _$ApiCityFromJson(json);

//   // Преобразование объекта в json формат
//   Map<String, dynamic> toJson() => _$ApiCityToJson(this);
// }

// @JsonSerializable()
// class Location {
//   final double lon;
//   final double lat;

//   Location({
//     required this.lon,
//     required this.lat,
//   });
//   // преобразование json-ответа в объект типа Location
//   factory Location.fromJson(Map<String, dynamic> json) =>
//       _$LocationFromJson(json);

//   // Преобразование объекта в json формат
//   Map<String, dynamic> toJson() => _$LocationToJson(this);
// }

// @JsonSerializable()
// class SavedCities {
//   @JsonKey(name: 'citiesList')
//   final List<ApiCity> citiesList;

//   SavedCities({
//     required this.citiesList,
//   });

//   // преобразование json-ответа в объект типа SavedCities
//   factory SavedCities.fromJson(Map<String, dynamic> json) =>
//       _$SavedCitiesDataFromJson(json);

//   // Преобразование объекта в json формат
//   Map<String, dynamic> toJson() => _$SavedCitiesDataToJson(this);
// }
