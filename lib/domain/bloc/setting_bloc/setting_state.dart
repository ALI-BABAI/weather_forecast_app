part of 'setting_bloc.dart';

abstract class SettingState {}

final class LoadingSettingState extends SettingState {}

final class LoadedSettingState extends SettingState {
  final List<CityModel> cities;
  final List<WeatherModel> weatherData;

  LoadedSettingState({
    required this.cities,
    required this.weatherData,
  });
}

final class SearchCityState extends SettingState {}

final class DeleteCityState extends SettingState {}

final class ErrorSettingState extends SettingState {}

final class OpenWeatherScreenState extends SettingState {}
