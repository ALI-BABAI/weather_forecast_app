part of 'setting_bloc.dart';

sealed class SettingEvent {}

class LoadSettingsEvent extends SettingEvent {}

class SetLanguageEvent extends SettingEvent {
  SetLanguageEvent(this.language);

  final String language;
}

class SetMeasurementUnitEvent extends SettingEvent {}
