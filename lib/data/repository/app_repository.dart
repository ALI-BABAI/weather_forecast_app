import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:weather_forecast_app/data/services/api_service.dart';
import 'package:weather_forecast_app/data/services/storage_service.dart';
import 'package:weather_forecast_app/domain/models/city_model.dart';
import 'package:weather_forecast_app/domain/models/weather_model.dart';
import 'package:weather_forecast_app/domain/repository/setting_repository.dart';
import 'package:weather_forecast_app/domain/repository/weather_repository.dart';

class AppRepository implements WeatherRepository, SettingRepository {
  final SharedPreferences prefs;
  static const String _citiesKey = 'citiesKey2';

  AppRepository(this.prefs);

  @override
  void addCityInFavourite() {
    debugPrint("Добавление города в список избранных: $_citiesKey");
  }

  @override
  void deleteCityFromFavourite() {
    debugPrint("Удаление города из списка избранных");
  }

  @override
  List<CityModel> getFavouriteCities() {
    try {
      final StorageService storageService = StorageService(prefs);
      String storedData = storageService.getStoragedData(_citiesKey);

      if (storedData.isEmpty) {
        storageService.createDefaultCity(_citiesKey);
        storedData = storageService.getStoragedData(_citiesKey);
      }

      final List<dynamic> cityJsonList = jsonDecode(storedData);
      final List<CityModel> favouriteCities =
          cityJsonList.map((cityJson) => CityModel.fromJson(cityJson)).toList();

      return favouriteCities;
    } catch (e) {
      debugPrint("Не удалось получить список сохранённых городов:\n error: $e");
      throw UnimplementedError();
    }
  }

  @override
  Future<List<WeatherModel>> getWeatherInfo(List<CityModel> cities) async {
    try {
      final ApiClient apiClient = ApiClient();
      List<WeatherModel> weatherDataList = [];

      for (final city in cities) {
        WeatherModel weatherData = await apiClient.getWeather(
          lat: city.lat,
          lon: city.lon,
        );
        weatherDataList.add(weatherData);
      }
      return weatherDataList;
    } catch (e) {
      throw UnimplementedError();
    }
  }
}
