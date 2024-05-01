part of 'setting_bloc.dart';

class SettingState {
  SettingState({
    this.language = AppLanguages.en,
    this.temperatureUnit = TemperatureUnit.celsius,
  });

  final AppLanguages language;
  final TemperatureUnit temperatureUnit;

  SettingState copyWith({
    AppLanguages? language,
    TemperatureUnit? temperatureUnit,
  }) {
    return SettingState(
      language: language ?? this.language,
      temperatureUnit: temperatureUnit ?? this.temperatureUnit,
    );
  }
}
