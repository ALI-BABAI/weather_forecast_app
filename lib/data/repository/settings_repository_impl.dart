import 'package:flutter/material.dart';
import 'package:weather_forecast_app/data/services/storage_service.dart';
import 'package:weather_forecast_app/domain/enums/app_languages.dart';
import 'package:weather_forecast_app/domain/enums/measurement_units.dart';
import 'package:weather_forecast_app/domain/repository/settings_repository.dart';

final class SettingsRepositoryImpl implements SettingsRepository {
  SettingsRepositoryImpl(this.storageService);

  final StorageService storageService;
  static const String _language = 'language';
  static const String _temperatureUnit = 'temperature';

  @override
  AppLanguages getLanguage() {
    try {
      String? storedData = storageService.getStoragedData(_language);

      switch (storedData) {
        case 'ru':
        case 'Русский':
          return AppLanguages.ru;
        default:
          return AppLanguages.en;
      }
    } catch (e) {
      debugPrint("Не удалось получить установленный язык:\n error: $e");
      throw UnimplementedError(
          "Не удалось получить установленный язык:\n error: $e");
    }
  }

  @override
  TemperatureUnit getMeasurementUnit() {
    try {
      String? storedData = storageService.getStoragedData(_temperatureUnit);
      switch (storedData) {
        case 'Fahrenheit':
        case 'Фаренгейт':
          return TemperatureUnit.fahrenheit;
        case 'Kelvin':
        case 'Кельвин':
          return TemperatureUnit.kelvin;
        default:
          return TemperatureUnit.celsius;
      }
    } catch (e) {
      debugPrint(
          "Не удалось получить единицу измерения для температуры:\n error: $e");
      throw UnimplementedError(
          "Не удалось получить единицу измерения для температуры:\n error: $e");
    }
  }

  @override
  Future<void> setLanguage(AppLanguages language) async {
    try {
      final previousLanguage = getLanguage();
      if (previousLanguage != language) {
        await storageService.saveData(_language, language.name);
      }
    } catch (e) {
      debugPrint("Ошибка при добавление города в список избранных: $_language");
      rethrow;
    }
  }

  @override
  Future<void> setTemperatureUnit(TemperatureUnit temperatureUnit) async {
    try {
      final previousUnit = getMeasurementUnit();
      if (previousUnit != temperatureUnit) {
        await storageService.saveData(_temperatureUnit, temperatureUnit.name);
      }
    } catch (e) {
      debugPrint(
          "Ошибка при сохранении единицы измерения температуры: $_temperatureUnit");
      rethrow;
    }
  }
}
