import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:weather_forecast_app/repositories/network/models/city_model.dart';

// Считывание файла и сохранение считанных городов в переменную типа SavedCities
Future<SavedCities?> readSavedCitiesInfo(File savedCitiesFile) async {
  try {
    final String data = await savedCitiesFile.readAsString();
    final Map<String, dynamic> jsonData = jsonDecode(data);
    return SavedCities.fromJson(jsonData);
  } catch (exeption) {
    debugPrint('Ошибка при чтении файла: $exeption');
    return null;
  }
}
