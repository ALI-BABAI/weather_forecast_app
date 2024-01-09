import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:weather_forecast_app/repositories/network/models/city_model.dart';

class PreferencesManager {
  static const String _citiesKey = 'citiesKey';
  bool _hasKey = false;
  bool _hasData = false;

  late SharedPreferences _prefs;

  // проверка наличия списка сохранённых городов : создание дефолтного
  Future<void> initData() async {
    _prefs = await SharedPreferences.getInstance();
    _hasKey = _prefs.containsKey(_citiesKey);
    SavedCities kek = await getListSavedCities();
    
    _hasData = kek.citiesList.isNotEmpty;

    if (_hasKey & _hasData) {
    } else {
      await _createDefaultCity();
    }
  }

  Future<void> _createDefaultCity() async {
    _prefs = await SharedPreferences.getInstance();
    SavedCities initialData = SavedCities(
      citiesList: [
        CityModel(
          name: "Ulyanovsk",
          country: "RU",
          lon: 48.400002,
          lat: 54.333332,
        ),
      ],
    );
    String defaultCity = jsonEncode(initialData);
    await _prefs.setString(_citiesKey, defaultCity);
  }

  // получение списка городов из SharedPreferences
  Future<SavedCities> getListSavedCities() async {
    _prefs = await SharedPreferences.getInstance();
    String citiesJson = _prefs.getString(_citiesKey)!;
    SavedCities savedCities = SavedCities.fromJson(jsonDecode(citiesJson));
    return savedCities;
  }

  // сохранение списка городов в SharedPreferences
  Future<void> saveCitiesList({required SavedCities savedCities}) async {
    _prefs = await SharedPreferences.getInstance();
    String citiesJson = jsonEncode(savedCities);
    _prefs.setString(_citiesKey, citiesJson);
  }
}
