import 'package:weather_forecast_app/domain/models/city_model.dart';
import 'package:weather_forecast_app/domain/models/weather_model.dart';

abstract class SettingState {}

final class LoadingState extends SettingState {}

final class LoadedState extends SettingState {
  final List<CityModel> cities;
  final List<WeatherModel> weatherData;

  LoadedState({
    required this.cities,
    required this.weatherData,
  });
}

final class SearchingCityState extends SettingState {}

final class DeleteCityState extends SettingState {}

final class ErrorState extends SettingState {}

final class OpenWeatherScreenState extends SettingState {}