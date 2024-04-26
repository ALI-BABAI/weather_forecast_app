abstract interface class SettingsRepository {
  late String defaultLanguage;
  String getLanguage();
  Future<void> setLanguage(String language);
}
