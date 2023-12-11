import 'package:json_annotation/json_annotation.dart';

part 'cities.g.dart';

// наличие ошибок (3х) является нормой. нужно сгенериться дать файлу
// Аввада-кедавра которую нужно ввести в терминале:

// dart run build_runner build   // dart run build_runner watch

// Для правильной работы сей прекрасного инструмента как <сериализатор>*
// Необходимо реализовать для каждого объекта класса свой собственный генератор*

// Признак для автосборщика чтоб он "творил"
@JsonSerializable()
class ApiCity {
  final String name;
  final String country;
  // Передаёт автосборщику инструкцию о привязке данных из ключа в переменную timezoneOffset
  @JsonKey(name: 'coord')
  final Location location; // объект содержащий в себя свои вложеные ключи

  ApiCity({
    required this.name,
    required this.country,
    required this.location,
  });
  // конвертация из гсона в класс
  factory ApiCity.fromJson(Map<String, dynamic> json) =>
      _$ApiCityFromJson(json);

  // конвертация из сгенирированных данных в джсон
  Map<String, dynamic> toJson() => _$ApiCityToJson(this);
}

@JsonSerializable()
class Location {
  final double lon;
  final double lat;

  Location({
    required this.lon,
    required this.lat,
  });
  // конвертация из гсона в класс
  factory Location.fromJson(Map<String, dynamic> json) =>
      _$LocationFromJson(json);

  // конвертация из сгенирированных данных в джсон
  Map<String, dynamic> toJson() => _$LocationToJson(this);
}

@JsonSerializable()
class SavedCitiesData {
  @JsonKey(name: 'favouriteCities')
  final List<ApiCity> favouriteCities;

  SavedCitiesData({
    required this.favouriteCities,
  });

  // конвертация из гсона в класс
  factory SavedCitiesData.fromJson(Map<String, dynamic> json) =>
      _$SavedCitiesDataFromJson(json);

  // конвертация из сгенирированных данных в джсон
  Map<String, dynamic> toJson() => _$SavedCitiesDataToJson(this);
}
