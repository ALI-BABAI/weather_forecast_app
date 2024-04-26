part of 'location_bloc.dart';

sealed class LocationEvent {}

final class AddCityEvent extends LocationEvent {
  AddCityEvent(this.cityName);

  final String cityName;
}

final class DeleteCityEvent extends LocationEvent {
  DeleteCityEvent(this.index);

  final int index;
}

final class ChangeCityIndexEvent extends LocationEvent {
  ChangeCityIndexEvent(
    this.indexNew,
    this.indexOld,
  );

  final int indexNew;
  final int indexOld;
}

final class LoadingSettingScreenEvent extends LocationEvent {}

final class MoveToWeatherScreenEvent extends LocationEvent {}
