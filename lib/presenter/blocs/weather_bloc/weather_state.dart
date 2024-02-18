import 'package:weather_forecast_app/domain/models/city_model.dart';
import 'package:weather_forecast_app/domain/models/weather_model.dart';

abstract class WeatherState {}

final class LoadingState extends WeatherState {}

final class LoadedState extends WeatherState {
  final List<CityModel> cities;
  final List<WeatherModel> weatherData;

  LoadedState({
    required this.cities,
    required this.weatherData,
  });
}

final class ErrorState extends WeatherState {
  final String errorMessage;

  ErrorState(this.errorMessage);
}
