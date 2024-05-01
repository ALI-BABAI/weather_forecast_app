import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:weather_forecast_app/data/services/api_service.dart';
import 'package:weather_forecast_app/data/services/storage_service.dart';
import 'package:weather_forecast_app/domain/models/city_model.dart';
import 'package:weather_forecast_app/domain/models/weather_model.dart';
import 'package:weather_forecast_app/domain/repository/weather_repository.dart';

import '../../domain/enums/measurement_units.dart';
import '../../l10n/localization_without_context.dart';
import '../app_keys.dart';

class WeatherRepositoryImpl implements WeatherRepository {
  WeatherRepositoryImpl(this.storageService);

  final StorageService storageService;

  @override
  List<CityModel> favouriteCities = [];
  @override
  List<WeatherModel> weatherDataList = [];

  @override
  Future<List<CityModel>> getFavouriteCities() async {
    try {
      String? storedData = storageService.getStoragedData(AppKeys.citiesKey);

      if (storedData == null) {
        await _createDefaultCity();
        storedData = storageService.getStoragedData(AppKeys.citiesKey);
      }

      final List<dynamic> cityJsonList = jsonDecode(storedData!);
      favouriteCities =
          cityJsonList.map((cityJson) => CityModel.fromJson(cityJson)).toList();

      return favouriteCities;
    } catch (e) {
      throw (tr.ErrorCantGetSavedCities(e));
    }
  }

  @override
  Future<List<WeatherModel>> getWeatherInfo(List<CityModel> cities) async {
    try {
      weatherDataList.clear();
      final ApiService apiService = _getApiService();
      for (final city in cities) {
        WeatherModel weatherData = await apiService.getWeather(
          lat: city.lat,
          lon: city.lon,
        );
        weatherDataList.add(weatherData);
      }
      return weatherDataList;
    } catch (e) {
      throw (tr.ErrorCantGetWeatherInfo(e));
    }
  }

  Future<List<WeatherModel>> getWeatherInfoAtCity(CityModel city) async {
    try {
      final ApiService apiService = _getApiService();
      WeatherModel weatherData = await apiService.getWeather(
        lat: city.lat,
        lon: city.lon,
      );
      weatherDataList.add(weatherData);
      return weatherDataList;
    } catch (e) {
      throw (tr.ErrorCantGetWeatherInfo(e));
    }
  }

  @override
  Future<void> addCityInFavourite(String cityToAdding) async {
    try {
      cityToAdding = cityToAdding.toLowerCase().replaceAll(' ', '');
      // checking the presence of the "city" in the favorites list
      bool isAddedCityAlreadyExist = favouriteCities.any((element) =>
          element.name.toLowerCase().replaceAll(' ', '') == cityToAdding);
      if (isAddedCityAlreadyExist) {
        throw (tr.ErrorCityAlreadyExistInFavourites);
      } else {
        String assetsJsonCitiesString =
            await rootBundle.loadString('assets/city_list.json');
        // search for a match of the "added city" with the general list of cities
        // is performed in a separate isolate using the "getMatchedCity" method
        final appendedCity = await compute(
            getMatchedCity, [assetsJsonCitiesString, cityToAdding]);
        if (appendedCity.name != '') {
          favouriteCities.add(
            CityModel(
              name: appendedCity.name,
              country: appendedCity.country,
              lon: appendedCity.lon,
              lat: appendedCity.lat,
            ),
          );
          // saving a list of favorites to the storage
          await storageService.saveData(
              AppKeys.citiesKey, jsonEncode(favouriteCities));
          // uploading up-to-date city data
          await getWeatherInfoAtCity(favouriteCities.last);
        } else {
          throw (tr.ErrorCityNotFound);
        }
      }
    } catch (e) {
      debugPrint(tr.ErrorAddingCityInFavourite(e));
      rethrow;
    }
  }

  @override
  Future<void> deleteCityFromFavourite(int index) async {
    try {
      favouriteCities.removeAt(index);
      weatherDataList.removeAt(index);
      final cities = jsonEncode(favouriteCities);
      await storageService.saveData(AppKeys.citiesKey, cities);
    } catch (e) {
      throw (tr.ErrorCantDeleteCityFromFavourite(e));
    }
  }

  @override
  Future<void> changeCityIndex(int newIndex, int oldIndex) async {
    if (oldIndex < newIndex) {
      newIndex -= 1;
    }
    // rearrangement cities
    final itemCities = favouriteCities.removeAt(oldIndex);
    favouriteCities.insert(newIndex, itemCities);
    // rearrangement weather
    final itemWeather = weatherDataList.removeAt(oldIndex);
    weatherDataList.insert(newIndex, itemWeather);
    // rewrite data in storageData
    final cities = jsonEncode(favouriteCities);
    await storageService.saveData(AppKeys.citiesKey, cities);
  }

  Future<void> _createDefaultCity() async {
    final defaultCity = [
      CityModel(
        name: "Ulyanovsk",
        country: "RU",
        lon: 48.400002,
        lat: 54.333332,
      )
    ];
    final defaultCityJson =
        jsonEncode(defaultCity.map((e) => e.toJson()).toList());
    await storageService.saveData(AppKeys.citiesKey, defaultCityJson);
  }

  ApiService _getApiService() {
    final TemperatureUnit storageTemperatureUnit;
    final storagedData = storageService.getStoragedData(AppKeys.temperatureKey);
    switch (storagedData) {
      case 'Fahrenheit':
      case 'Фаренгейт':
        storageTemperatureUnit = TemperatureUnit.fahrenheit;
      case 'Kelvin':
      case 'Кельвин':
        storageTemperatureUnit = TemperatureUnit.kelvin;
      default:
        storageTemperatureUnit = TemperatureUnit.celsius;
    }

    return ApiService(
      language: storageService.getStoragedData(AppKeys.temperatureKey),
      temperatureUnit: storageTemperatureUnit,
    );
  }
}

// compute method for search city in global cities file
CityModel getMatchedCity(List<String> cities) {
  String assetsCitiesString = cities[0];
  String userAddedCity = cities[1];
  final List<dynamic> assetsCities = json.decode(assetsCitiesString);

  // Converting data from global file with cities to CityModel objects
  final List<CityModel> assetCityItem =
      assetsCities.map((json) => CityModel.fromJson(json)).toList();
  // Checking for a match
  CityModel matchedCity = assetCityItem.firstWhere(
    (city) => city.name.toLowerCase().replaceAll(' ', '') == userAddedCity,
    orElse: () => CityModel(
      name: '',
      country: '',
      lon: 0.0,
      lat: 0.0,
    ),
  );
  return matchedCity;
}
