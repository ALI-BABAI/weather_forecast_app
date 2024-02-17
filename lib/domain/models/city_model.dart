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
  factory CityModel.fromJson(Map<String, dynamic> json) {
    return CityModel(
      name: json['name'] as String,
      country: json['country'] as String,
      lon: json['coord']['lon'] as double,
      lat: json['coord']['lat'] as double,
    );
  }
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

// @todo - заменить на SavedCitiesModel или удалить вовсе
class SavedCities {
  final List<CityModel> citiesList;

  SavedCities({
    required this.citiesList,
  });
  factory SavedCities.fromJson(Map<String, dynamic> json) {
    return SavedCities(
      citiesList: (json['citiesList'] as List<dynamic>)
          .map((e) => CityModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }
  Map<String, dynamic> toJson() {
    return {
      'citiesList': citiesList.map((city) => city.toJson()).toList(),
    };
  }
}
