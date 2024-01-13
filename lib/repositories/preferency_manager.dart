import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:weather_forecast_app/main.dart';
import 'package:weather_forecast_app/repositories/network/api_client.dart';
import 'package:weather_forecast_app/repositories/network/models/city_model.dart';
import 'package:weather_forecast_app/repositories/network/models/weather_model.dart';

class PreferencesManager extends ChangeNotifier {
  final SharedPreferences prefs;

  PreferencesManager(this.prefs);

  // приватные ключи для работы с данными на устройства юзера
  // нужно ли их хранить данные о погоде на устройстве юзера?
  // static const String _weatherKey = 'weatherKey';
  static const String _citiesKey = 'citiesKey';
  late SavedCities savedListOfCities;

  // проверка наличия списка сохранённых городов : создание дефолтного
  Future<void> initData() async {
    bool hasData = false;
    bool hasKey = prefs.containsKey(_citiesKey);
    if (!hasKey) {
      await _createDefaultCity();
    } else {
      savedListOfCities = _getListSavedCities();
      hasData = savedListOfCities.citiesList.isNotEmpty;
      if (!hasData) {
        await _createDefaultCity();
      }
    }
    savedListOfCities = _getListSavedCities();
  }

  // создание дефолтного экземпляра списка сохранённых городов
  Future<void> _createDefaultCity() async {
    savedListOfCities = SavedCities(
      citiesList: [
        CityModel(
          name: "Ulyanovsk",
          country: "RU",
          lon: 48.400002,
          lat: 54.333332,
        ),
              CityModel(
          name: "Рандомный город с длинным названием",
          country: "US",
          lon: -82.348056,
          lat: 35.479167,
        ),
      ],
    );
    String defaultCity = jsonEncode(savedListOfCities);
    await prefs.setString(_citiesKey, defaultCity);
  }

  // получение списка городов из SharedPreferences
  SavedCities _getListSavedCities() {
    String citiesJson = prefs.getString(_citiesKey)!;
    SavedCities savedCities = SavedCities.fromJson(jsonDecode(citiesJson));
    return savedCities;
  }

  // сохранение списка городов в SharedPreferences
  Future<void> _saveCitiesList({required SavedCities savedCities}) async {
    String citiesJson = jsonEncode(savedCities);
    await prefs.setString(_citiesKey, citiesJson);
  }

  // обработка добавления пользователем города
  Future<void> addCityToDB({required String userString}) async {
    String jsonString;

    try {
      userString = userString.toLowerCase().replaceAll(' ', '');
      bool isExist = savedListOfCities.citiesList.any(
          (city) => city.name.toLowerCase().replaceAll(' ', '') == userString);
      if (isExist) {
        debugPrint('Город уже существует в списке.');
        //  setState(
        //   () {
        //     AppAllertWindow.warningCityAlreadyExist(context);
        //   },
      } else {
        jsonString = await rootBundle.loadString('assets/city_list.json');
        final List<dynamic> citiesData = json.decode(jsonString);

        // Преобразование данных в объекты City
        final List<CityModel> cityItem =
            citiesData.map((json) => CityModel.fromJson(json)).toList();
        // Поиск введённого города из списка
        final CityModel selectedCity = cityItem.firstWhere(
          (city) => city.name.toLowerCase().replaceAll(' ', '') == userString,
          orElse: () => CityModel(
            name: '',
            country: '',
            lon: 0.0,
            lat: 0.0,
          ),
        );
        if (selectedCity.name != '') {
          savedListOfCities.citiesList.add(
            CityModel(
              name: selectedCity.name,
              country: selectedCity.country,
              lon: selectedCity.lon,
              lat: selectedCity.lat,
            ),
          );
          await _saveCitiesList(savedCities: savedListOfCities);
          WeatherModel? weatherModel = await ApiClient().getWeatherInfoAsObject(
              lat: selectedCity.lat, lon: selectedCity.lon);

          // добавляем в глобальную переменную инфу по добавленному городу
          weatherInSavedCities.add(weatherModel);
        }
        // else{
        //  AppAllertWindow.warningCityNotFound(context);
        // }
      }
    } catch (error) {
      debugPrint(error.toString());
    }
    notifyListeners();
    // _cityController.clear();
    // FocusScope.of(context).unfocus();
  }

  // обработка удаления города
  void removeCityInDB(int index) {
    savedListOfCities.citiesList.removeAt(index);
    weatherInSavedCities.removeAt(index);
    _saveCitiesList(savedCities: savedListOfCities);
    notifyListeners();
  }
}
