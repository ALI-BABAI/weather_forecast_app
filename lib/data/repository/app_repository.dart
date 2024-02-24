import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:weather_forecast_app/data/services/api_service.dart';
import 'package:weather_forecast_app/data/services/storage_service.dart';
import 'package:weather_forecast_app/domain/models/city_model.dart';
import 'package:weather_forecast_app/domain/models/weather_model.dart';
import 'package:weather_forecast_app/domain/repository/setting_repository.dart';
import 'package:weather_forecast_app/domain/repository/weather_repository.dart';

// пробрасывать StorageService подобно prefs по всему приложению
// или же создавать в нужных местах его?

// У фокса был видос,  описывающий степень сложности перехода/поиска элемента по дереву виджетов
// пробрасывать подобно 21 строке он говорил что максимально затратная вещь
// видел подобное там<findAncestorWidgetOfExactType>, но не понял как юзать
class AppRepository implements WeatherRepository, SettingRepository {
  final SharedPreferences prefs;
  static const String _citiesKey = 'citiesKey2';

  AppRepository(this.prefs);

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
      throw UnimplementedError(
          "Не удалось получить список сохранённых городов:\n error: $e");
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
      throw UnimplementedError("Не удалось получить информацию о погоде:/n$e");
    }
  }

  // для записи нового города нужно знать список уже сохранённый городов
  @override
  Future<void> addCityInFavourite(String cityToAdding) async {
    try {
      // получаем список сохранённых городов
      List<CityModel> existedCities = getFavouriteCities();
      // преобразуем введенный текст "добавляемый город" для дальнейшей обработки
      cityToAdding = cityToAdding.toLowerCase().replaceAll(' ', '');
      // проверка наличия "добавляемого города" в списке избранных
      final StorageService storageService = StorageService(prefs);
      bool isAddedCityAlreadyExist = existedCities.any((element) =>
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
          existedCities.add(
            CityModel(
              name: appendedCity.name,
              country: appendedCity.country,
              lon: appendedCity.lon,
              lat: appendedCity.lat,
            ),
          );
          await storageService.saveData(_citiesKey, jsonEncode(existedCities));
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
      final StorageService storageService = StorageService(prefs);
      // получаем список сохранённых городов
      List<CityModel> existedCities = getFavouriteCities();
      existedCities.removeAt(index);
      await storageService.saveData(_citiesKey, jsonEncode(existedCities));
    } catch (e) {
      debugPrint("Ошибка удаления города из списка избранных");
      rethrow;
    }
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
