import 'package:weather_forecast_app/data/services/storage_service.dart';
import 'package:weather_forecast_app/domain/enums/app_languages.dart';
import 'package:weather_forecast_app/domain/enums/measurement_units.dart';
import 'package:weather_forecast_app/domain/repository/settings_repository.dart';

import '../../l10n/localization_without_context.dart';
import '../app_keys.dart';

final class SettingsRepositoryImpl implements SettingsRepository {
  SettingsRepositoryImpl(this.storageService);

  final StorageService storageService;

  @override
  AppLanguages getLanguage() {
    try {
      String? storedData = storageService.getStoragedData(AppKeys.languageKey);

      switch (storedData) {
        case 'ru':
        case 'Русский':
          return AppLanguages.ru;
        default:
          return AppLanguages.en;
      }
    } catch (e) {
      throw (tr.ErrorCantGetSavedLanguage(e));
    }
  }

  @override
  TemperatureUnit getMeasurementUnit() {
    try {
      String? storedData =
          storageService.getStoragedData(AppKeys.temperatureKey);
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
      throw (tr.ErrorCantGetTemperatureMeasurementUnit(e));
    }
  }

  @override
  Future<void> setLanguage(AppLanguages language) async {
    try {
      final previousLanguage = getLanguage();
      if (previousLanguage != language) {
        await storageService.saveData(AppKeys.languageKey, language.name);
      }
    } catch (e) {
      throw (tr.ErrorOnSettingLanguage(e));
    }
  }

  @override
  Future<void> setTemperatureUnit(TemperatureUnit unit) async {
    try {
      final previousUnit = getMeasurementUnit();
      if (previousUnit != unit) {
        await storageService.saveData(AppKeys.temperatureKey, unit.name);
      }
    } catch (e) {
      throw (tr.ErrorOnSettingTemperatureUnit(e));
    }
  }
}
