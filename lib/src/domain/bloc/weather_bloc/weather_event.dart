part of 'weather_bloc.dart';

abstract class WeatherEvent {}

final class LoadingWeatherScreenEvent extends WeatherEvent {}

final class MoveToSettingScreenEvent extends WeatherEvent {}
