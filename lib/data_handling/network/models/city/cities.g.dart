// // GENERATED CODE - DO NOT MODIFY BY HAND

// part of 'cities.dart';

// // **************************************************************************
// // JsonSerializableGenerator
// // **************************************************************************

// ApiCityModel _$ApiCityFromJson(Map<String, dynamic> json) => ApiCityModel(
//       name: json['name'] as String,
//       country: json['country'] as String,
//       location: Location.fromJson(json['coord'] as Map<String, dynamic>),
//     );

// Map<String, dynamic> _$ApiCityToJson(ApiCityModel instance) => <String, dynamic>{
//       'name': instance.name,
//       'country': instance.country,
//       'coord': instance.location,
//     };

// Location _$LocationFromJson(Map<String, dynamic> json) => Location(
//       lon: (json['lon'] as num).toDouble(),
//       lat: (json['lat'] as num).toDouble(),
//     );

// Map<String, dynamic> _$LocationToJson(Location instance) => <String, dynamic>{
//       'lon': instance.lon,
//       'lat': instance.lat,
//     };

// SavedCities _$SavedCitiesDataFromJson(Map<String, dynamic> json) =>
//     SavedCities(
//       citiesList: (json['citiesList'] as List<dynamic>)
//           .map((e) => ApiCityModel.fromJson(e as Map<String, dynamic>))
//           .toList(),
//     );

// Map<String, dynamic> _$SavedCitiesDataToJson(SavedCities instance) =>
//     <String, dynamic>{
//       'citiesList': instance.citiesList,
//     };
