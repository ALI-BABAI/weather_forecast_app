import 'package:flutter/material.dart';
import 'package:weather_forecast_app/data/services/storage_service.dart';
import 'package:weather_forecast_app/domain/repository/settings_repository.dart';

final class SettingsRepositoryImpl implements SettingsRepository {
  SettingsRepositoryImpl(this.storageService);

  final StorageService storageService;
  static const String _language = 'language';

  @override
  String defaultLanguage = 'en';

  @override
  String getLanguage() {
    try {
      String? storedData = storageService.getStoragedData(_language);

      if (storedData.isEmpty) return defaultLanguage;

      return storedData;
    } catch (e) {
      debugPrint("Не удалось получить установленный язык:\n error: $e");
      throw UnimplementedError(
          "Не удалось получить установленный язык:\n error: $e");
    }
  }

  @override
  Future<void> setLanguage(String language) async {
    try {
      final previousLanguage = getLanguage();
      if (previousLanguage != language) {
        await storageService.saveData(_language, language);
      }
    } catch (e) {
      debugPrint("Добавление города в список избранных: $_language");
      rethrow;
    }
  }
}
