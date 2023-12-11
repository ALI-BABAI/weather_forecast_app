// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cities.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ApiCity _$ApiCityFromJson(Map<String, dynamic> json) => ApiCity(
      name: json['name'] as String,
      country: json['country'] as String,
      location: Location.fromJson(json['coord'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$ApiCityToJson(ApiCity instance) => <String, dynamic>{
      'name': instance.name,
      'country': instance.country,
      'coord': instance.location,
    };

Location _$LocationFromJson(Map<String, dynamic> json) => Location(
      lon: (json['lon'] as num).toDouble(),
      lat: (json['lat'] as num).toDouble(),
    );

Map<String, dynamic> _$LocationToJson(Location instance) => <String, dynamic>{
      'lon': instance.lon,
      'lat': instance.lat,
    };

SavedCitiesData _$SavedCitiesDataFromJson(Map<String, dynamic> json) =>
    SavedCitiesData(
      favouriteCities: (json['favouriteCities'] as List<dynamic>)
          .map((e) => ApiCity.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$SavedCitiesDataToJson(SavedCitiesData instance) =>
    <String, dynamic>{
      'favouriteCities': instance.favouriteCities,
    };
