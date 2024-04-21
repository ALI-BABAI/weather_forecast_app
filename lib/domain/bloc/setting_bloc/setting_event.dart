part of 'setting_bloc.dart';

sealed class SettingEvent {}

final class LoadingSettingScreenEvent extends SettingEvent {}

final class AddCityEvent extends SettingEvent {
  AddCityEvent(this.cityName);

  final String cityName;
}

final class DeleteCityEvent extends SettingEvent {
  DeleteCityEvent(this.index);

  final int index;
}

final class ChangeCityIndexEvent extends SettingEvent {
  ChangeCityIndexEvent(
    this.indexNew,
    this.indexOld,
  );

  final int indexNew;
  final int indexOld;
}

final class TollTapEvent extends SettingEvent {}

final class MoveToWeatherScreenEvent extends SettingEvent {}
