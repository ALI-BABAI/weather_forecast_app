import 'dart:async';
import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:weather_forecast_app/domain/models/city_model.dart';
import 'package:weather_forecast_app/domain/models/weather_model.dart';
import 'package:weather_forecast_app/main.dart';
import 'package:weather_forecast_app/data/services/api_service.dart';

enum SearchState {
  loaded,
  loading,
}

class PreferencesManager extends ChangeNotifier {
  final SharedPreferences prefs;

  PreferencesManager(this.prefs);

  // приватные ключи для работы с данными на устройства юзера
  // нужно ли их хранить данные о погоде на устройстве юзера?
  // static const String _weatherKey = 'weatherKey';
  static const String _citiesKey = 'citiesKey';
  late SavedCities savedListOfCities;

  var _searchState = SearchState.loaded;

  SearchState getSearchingState() {
    return _searchState;
  }

  setSearchingState(SearchState state) {
    _searchState = state;
    notifyListeners();
  }

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
    setSearchingState(SearchState.loading);
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
        String jsonString =
            await rootBundle.loadString('assets/city_list.json');
        final appendedCity =
            await compute(getMatchedCity, [jsonString, userString]);
        if (appendedCity.name != '') {
          savedListOfCities.citiesList.add(
            CityModel(
              name: appendedCity.name,
              country: appendedCity.country,
              lon: appendedCity.lon,
              lat: appendedCity.lat,
            ),
          );
          await _saveCitiesList(savedCities: savedListOfCities);
          WeatherModel? weatherModel = await ApiClient().getWeatherInfoAsObject(
              lat: appendedCity.lat, lon: appendedCity.lon);
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
    setSearchingState(SearchState.loaded);
    notifyListeners();
    // _cityController.clear();
    // FocusScope.of(context).unfocus();
  }

  // обработка удаления города
  void removeCityInDB(int index) {
    if (index == 0) {
      prefs.remove(_citiesKey);
    }
    savedListOfCities.citiesList.removeAt(index);
    weatherInSavedCities.removeAt(index);
    _saveCitiesList(savedCities: savedListOfCities);
    notifyListeners();
  }

  //
}

// Метод выполняемый в отдельном изоляте
CityModel getMatchedCity(List<String> element) {
  String jsonString = element[0];
  String userInput = element[1];
  final List<dynamic> citiesData = json.decode(jsonString);

  // Преобразование данных в объекты City
  final List<CityModel> cityItem =
      citiesData.map((json) => CityModel.fromJson(json)).toList();
  // Поиск введённого города из списка
  final CityModel matchedCity = cityItem.firstWhere(
    (city) => city.name.toLowerCase().replaceAll(' ', '') == userInput,
    orElse: () => CityModel(
      name: '',
      country: '',
      lon: 0.0,
      lat: 0.0,
    ),
  );
  return matchedCity;
}
