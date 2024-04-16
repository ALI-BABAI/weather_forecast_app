// import 'package:weather_forecast_app/domain/models/city_model.dart';
// import 'package:weather_forecast_app/domain/models/weather_model.dart';

part of 'weather_bloc.dart';

abstract class WeatherState {}

final class LoadingWeatherState extends WeatherState {}

final class LoadedWeatherState extends WeatherState {
  final List<CityModel> cities;
  final List<WeatherModel> weatherData;

  LoadedWeatherState({
    required this.cities,
    required this.weatherData,
  });
}

final class OpenSettingScreenState extends WeatherState {}

final class ErrorWeatherState extends WeatherState {
  final String errorMessage;

  ErrorWeatherState(this.errorMessage);
}
