abstract class WeatherEvent {} // sealed or abstract

final class LoadingWeatherInfoEvent extends WeatherEvent {}
final class MoveToSettingScreenEvent extends WeatherEvent {}

// enum WeatherEvents {
//   switchCity,
//   moveToSettingScreen,
// }
