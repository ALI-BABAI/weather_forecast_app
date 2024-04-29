import 'package:weather_forecast_app/domain/enums/measurement_units.dart';

import '../enums/app_languages.dart';

abstract interface class SettingsRepository {
  AppLanguages getLanguage();
  TemperatureUnit getMeasurementUnit();
  Future<void> setLanguage(AppLanguages language);
  Future<void> setTemperatureUnit(TemperatureUnit temperatureUnit);
}
