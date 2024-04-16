part of 'weather_bloc.dart';

abstract class WeatherEvent {} // sealed or abstract

final class LoadingWeatherScreenEvent extends WeatherEvent {}

final class MoveToSettingScreenEvent extends WeatherEvent {}
