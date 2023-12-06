// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cities.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

City _$CityFromJson(Map<String, dynamic> json) => City(
      name: json['name'] as String,
      country: json['country'] as String,
      location: Location.fromJson(json['coord'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$CityToJson(City instance) => <String, dynamic>{
      'name': instance.name,
      'country': instance.country,
      'coord': instance.location,
    };

Location _$LocationFromJson(Map<String, dynamic> json) => Location(
      lon: json['lon'] as String,
      lat: json['lat'] as String,
    );

Map<String, dynamic> _$LocationToJson(Location instance) => <String, dynamic>{
      'lon': instance.lon,
      'lat': instance.lat,
    };

FavouriteCitiesData _$FavouriteCitiesDataFromJson(Map<String, dynamic> json) =>
    FavouriteCitiesData(
      selectedCity: json['item'] as int,
      favouriteCities: (json['favouriteCities'] as List<dynamic>)
          .map((e) => City.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$FavouriteCitiesDataToJson(
        FavouriteCitiesData instance) =>
    <String, dynamic>{
      'item': instance.selectedCity,
      'favouriteCities': instance.favouriteCities,
    };
