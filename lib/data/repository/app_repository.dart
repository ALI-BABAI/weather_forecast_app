import 'package:flutter/material.dart';
import 'package:weather_forecast_app/domain/models/city_model.dart';
import 'package:weather_forecast_app/domain/repository/setting_repository.dart';
import 'package:weather_forecast_app/domain/repository/weather_repository.dart';

class AppRepository implements WeatherRepository, SettingRepository {
  static const String _citiesKey = 'citiesKey';

  @override
  void addCityInFavourite() {
    debugPrint("Добавление города в список избранных: $_citiesKey");
  }

  @override
  void deleteCityFromFavourite() {
    debugPrint("Удаление города из списка избранных");
  }

  @override
  SavedCities getFavouriteCities() {
    debugPrint("Получение списка сохранённых городов");
    throw UnimplementedError();
  }

  @override
  void getWeather() {
    debugPrint("Получение информации о погоде по избранным городам");
  }
}

  //   try {
  //     String citiesString = StorageService(sharedPreferences: sharedPreferences)
  //         .getStoragedData(_citiesKey);
  //     SavedCities favouriteCitiesList =
  //     return favouriteCitiesList;
  //   } catch (e) {
  //     debugPrint("получение информации о погоде в сохранённых городах");
  //   }