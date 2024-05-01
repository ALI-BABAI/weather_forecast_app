part of 'location_bloc.dart';

abstract class LocationState {}

final class LoadingSettingState extends LocationState {}

final class LoadedLocationState extends LocationState {
  final List<CityModel> cities;
  final List<WeatherModel> weatherData;
  final bool? isSearching;

  LoadedLocationState({
    this.isSearching,
    required this.cities,
    required this.weatherData,
  });

  LoadedLocationState copyWith({
    List<CityModel>? cities,
    List<WeatherModel>? weatherData,
    bool? isSearching,
  }) {
    return LoadedLocationState(
      cities: cities ?? this.cities,
      weatherData: weatherData ?? this.weatherData,
      isSearching: isSearching ?? this.isSearching,
    );
  }
}

final class SearchCityState extends LocationState {}

final class DeleteCityState extends LocationState {}

final class ErrorSettingState extends LocationState {
  ErrorSettingState(this.errorMessage);

  final String errorMessage;
}

final class OpenWeatherScreenState extends LocationState {}
