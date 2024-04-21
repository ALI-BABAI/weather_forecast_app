part of 'setting_bloc.dart';

abstract class SettingState {}

final class LoadingSettingState extends SettingState {}

final class LoadedSettingState extends SettingState {
  final List<CityModel> cities;
  final List<WeatherModel> weatherData;
  final bool? isSearching;

  LoadedSettingState({
    this.isSearching,
    required this.cities,
    required this.weatherData,
  });

  LoadedSettingState copyWith({
    List<CityModel>? cities,
    List<WeatherModel>? weatherData,
    bool? isSearching,
  }) {
    return LoadedSettingState(
      cities: cities ?? this.cities,
      weatherData: weatherData ?? this.weatherData,
      isSearching: isSearching ?? this.isSearching,
    );
  }
}

final class SearchCityState extends SettingState {}

final class DeleteCityState extends SettingState {}

final class ErrorSettingState extends SettingState {}

final class OpenWeatherScreenState extends SettingState {}
