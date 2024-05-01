part of 'weather_bloc.dart';

abstract class WeatherState {}

final class LoadingWeatherState extends WeatherState {}

final class OpenSettingScreenState extends WeatherState {}

final class LoadedWeatherState extends WeatherState {
  LoadedWeatherState({
    required this.cities,
    required this.weatherData,
  });

  final List<CityModel> cities;
  final List<WeatherModel> weatherData;
}

final class ErrorWeatherState extends WeatherState {
  ErrorWeatherState(this.errorMessage);

  final String errorMessage;
}
