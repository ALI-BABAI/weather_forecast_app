import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:weather_forecast_app/data_handling/network/models/city/cities.dart';

// Считывание файла и сохранение считанных городов в переменную типа SavedCitiesData
Future<SavedCitiesData?> readSavedCitiesInfo(File savedCitiesFile) async {
  try {
    final String data = await savedCitiesFile.readAsString();
    final Map<String, dynamic> jsonData = jsonDecode(data);
    return SavedCitiesData.fromJson(jsonData);
  } catch (exeption) {
    debugPrint('Ошибка при чтении файла: $exeption');
    return null;
  }
}
