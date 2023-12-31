class CityModel {
  final String name;
  final String country;
  final double lon;
  final double lat;

  CityModel({
    required this.name,
    required this.country,
    required this.lon,
    required this.lat,
  });
  // преобразование fromJson
  factory CityModel.fromJson(Map<String, dynamic> json) {
    return CityModel(
      name: json['name'] as String,
      country: json['country'] as String,
      lon: json['coord']['lon'] as double,
      lat: json['coord']['lat'] as double,
    );
  }
  // преобразование toJson
  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'country': country,
      'coord': {
        'lon': lon,
        'lat': lat,
      },
    };
  }
}

class SavedCities {
  final List<CityModel> citiesList;

  SavedCities({
    required this.citiesList,
  });
  // преобразование fromJson
  factory SavedCities.fromJson(Map<String, dynamic> json) {
    return SavedCities(
      citiesList: (json['citiesList'] as List<dynamic>)
          .map((e) => CityModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }
  // преобразование toJson
  Map<String, dynamic> toJson() {
    return {
      'citiesList': citiesList.map((city) => city.toJson()).toList(),
    };
  }
}

//  преобразование json-ответа в объект типа SavedCities
//   factory SavedCities.fromJson(Map<String, dynamic> json) =>
//       _$SavedCitiesDataFromJson(json);

//   // Преобразование объекта в json формат
//   Map<String, dynamic> toJson() => _$SavedCitiesDataToJson(this);
