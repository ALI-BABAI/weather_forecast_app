import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:weather_forecast_app/domain/models/city_model.dart';

class StorageService {
  StorageService(this.prefs);
  
  final SharedPreferences prefs;

  String getStoragedData(String key) {
    return prefs.getString(key) ?? '';
  }

  void createDefaultCity(String key) async {
    final defaultCity = [
      CityModel(
        name: "Ulyanovsk",
        country: "RU",
        lon: 48.400002,
        lat: 54.333332,
      )
    ];
    // final defaultCityJson =
    //     jsonEncode(defaultCity.map((city) => city.toJson()).toList());
    final defaultCityJson =
        jsonEncode(defaultCity.map((e) => e.toJson()).toList());
    await prefs.setString(key, defaultCityJson);
  }

  Future<void> saveData(String key, String data) async {
    await prefs.setString(key, data);
  }
}
