abstract class WeatherState {}

final class LoadingState extends WeatherState {}

final class LoadedState extends WeatherState {}

final class ErrorState extends WeatherState {}
