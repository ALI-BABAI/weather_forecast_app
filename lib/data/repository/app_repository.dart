import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:weather_forecast_app/data/services/api_service.dart';
import 'package:weather_forecast_app/data/services/storage_service.dart';
import 'package:weather_forecast_app/domain/models/city_model.dart';
import 'package:weather_forecast_app/domain/models/weather_model.dart';
import 'package:weather_forecast_app/domain/repository/weather_repository.dart';

class WeatherRepositoryImpl implements WeatherRepository {
  WeatherRepositoryImpl(this.storageService);

  final StorageService storageService;

  static const String _citiesKey = 'citiesKey';
  @override
  List<CityModel> favouriteCities = [];
  @override
  List<WeatherModel> weatherDataList = [];

  @override
  List<CityModel> getFavouriteCities() {
    try {
      String storedData = storageService.getStoragedData(_citiesKey);

      if (storedData.isEmpty) {
        storageService.createDefaultCity(_citiesKey);
        storedData = storageService.getStoragedData(_citiesKey);
      }

      final List<dynamic> cityJsonList = jsonDecode(storedData);
      favouriteCities =
          cityJsonList.map((cityJson) => CityModel.fromJson(cityJson)).toList();

      return favouriteCities;
    } catch (e) {
      debugPrint("Не удалось получить список сохранённых городов:\n error: $e");
      throw UnimplementedError(
          "Не удалось получить список сохранённых городов:\n error: $e");
    }
  }

  @override
  Future<List<WeatherModel>> getWeatherInfo(List<CityModel> cities) async {
    try {
      final ApiService apiClient = ApiService();

      for (final city in cities) {
        WeatherModel weatherData = await apiClient.getWeather(
          lat: city.lat,
          lon: city.lon,
        );
        weatherDataList.add(weatherData);
      }
      return weatherDataList;
    } catch (e) {
      throw UnimplementedError("Не удалось получить информацию о погоде:/n$e");
    }
  }

  Future<List<WeatherModel>> getWeatherInfoAtCity(CityModel city) async {
    try {
      final ApiService apiClient = ApiService();
      WeatherModel weatherData = await apiClient.getWeather(
        lat: city.lat,
        lon: city.lon,
      );
      weatherDataList.add(weatherData);
      return weatherDataList;
    } catch (e) {
      throw UnimplementedError("Не удалось получить информацию о погоде:/n$e");
    }
  }

  // для записи нового города нужно знать список уже сохранённый городов
  @override
  Future<void> addCityInFavourite(String cityToAdding) async {
    try {
      // преобразуем введенный текст "добавляемый город" для дальнейшей обработки
      cityToAdding = cityToAdding.toLowerCase().replaceAll(' ', '');
      // проверка наличия "добавляемого города" в списке избранных
      bool isAddedCityAlreadyExist = favouriteCities.any((element) =>
          element.name.toLowerCase().replaceAll(' ', '') == cityToAdding);
      if (isAddedCityAlreadyExist) {
        debugPrint("Город уже в списке избранных");
        throw Exception('Сity already exist in favourite');
      } else {
        String assetsJsonCitiesString =
            await rootBundle.loadString('assets/city_list.json');
        // поиск совпадения "добавляемого города" с общим списком городов
        // выполняемый в отдельном изоляте с помощью метода "getMatchedCity"
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
          // сохранение списка избранных в хранилище
          await storageService.saveData(
              _citiesKey, jsonEncode(favouriteCities));
          // подгрузка актуальных данных по городам
          await getWeatherInfoAtCity(favouriteCities.last);
        } else {
          throw UnimplementedError("Не удалось найти добавляемый город.");
        }
      }
    } catch (e) {
      debugPrint("Добавление города в список избранных: $_citiesKey");
      rethrow;
    }
  }

  @override
  Future<void> deleteCityFromFavourite(int index) async {
    try {
      debugPrint("Удаление города из списка избранных");
      favouriteCities.removeAt(index);
      weatherDataList.removeAt(index);
      await storageService.saveData(_citiesKey, jsonEncode(favouriteCities));
    } catch (e) {
      debugPrint("Ошибка удаления города из списка избранных");
      rethrow;
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
    await storageService.saveData(_citiesKey, jsonEncode(favouriteCities));
  }
}

// Поиск совпадения "добавляемого города" с общим списком городов
CityModel getMatchedCity(List<String> cities) {
  String assetsCitiesString = cities[0];
  String userAddedCity = cities[1];
  final List<dynamic> assetsCities = json.decode(assetsCitiesString);

  // Преобразование данных из общего файла с городами в объекты CityModel
  final List<CityModel> assetCityItem =
      assetsCities.map((json) => CityModel.fromJson(json)).toList();
  // Поиск совпадения "добавляемого города" с общим списком городов
  // возврат готовой или пустой модели города
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
