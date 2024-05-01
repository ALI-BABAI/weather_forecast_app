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
