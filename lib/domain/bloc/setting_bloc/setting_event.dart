part of 'setting_bloc.dart';

sealed class SettingEvent {}

class LoadSettingsEvent extends SettingEvent {}

class SetLanguageEvent extends SettingEvent {
  SetLanguageEvent(this.language);

  final AppLanguages language;
}

class SetTemperatureUnitEvent extends SettingEvent {
  SetTemperatureUnitEvent(this.unit);

  final TemperatureUnit unit;
}

class SetMeasurementUnitEvent extends SettingEvent {}
