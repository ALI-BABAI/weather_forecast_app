import 'package:shared_preferences/shared_preferences.dart';

class StorageService {
  final SharedPreferences sharedPreferences;

  StorageService({required this.sharedPreferences});

  String getStoragedData(String key) {
    if (sharedPreferences.containsKey(key)) {
      String? storagedData = sharedPreferences.getString(key);
      if (storagedData == null) {
        throw Exception('Нет данных по ключу');
      }
      return storagedData;
    } else {
      throw Exception('Нет такого ключа. Данных соответсвенно тоже нет');
    }
  }

  void saveData(String key, String data) async {
    await sharedPreferences.setString(key, data);
  }
}
