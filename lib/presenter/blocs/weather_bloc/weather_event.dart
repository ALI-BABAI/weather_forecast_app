abstract class WeatherEvent {} // sealed or abstract

final class SwitchCity extends WeatherEvent {}

final class MoveToSettingScreen extends WeatherEvent {}

enum WeatherEvents {
  switchCity,
  moveToSettingScreen,
}
