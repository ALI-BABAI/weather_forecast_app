abstract class SettingEvent {} // sealed or abstract

final class AddCity extends SettingEvent {}

final class DeleteCity extends SettingEvent {}

final class MoveToWeatherScreen extends SettingEvent {}
