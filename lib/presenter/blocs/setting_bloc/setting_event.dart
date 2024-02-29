part of 'setting_bloc.dart';

abstract class SettingEvent {} // sealed or abstract

final class LoadingSettingScreenEvent extends SettingEvent {}

final class AddCityEvent extends SettingEvent {
  final String cityName;

  AddCityEvent(this.cityName);
}

final class DeleteCityEvent extends SettingEvent {
  final int index;

  DeleteCityEvent(this.index);
}

final class TollTapEvent extends SettingEvent {}

final class MoveToWeatherScreenEvent extends SettingEvent {}
