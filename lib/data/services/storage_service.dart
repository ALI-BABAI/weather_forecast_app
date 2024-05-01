import 'package:shared_preferences/shared_preferences.dart';

class StorageService {
  StorageService(this.prefs);

  final SharedPreferences prefs;

  String? getStoragedData(String key) {
    return prefs.getString(key);
  }

  bool isContainKey(String key) {
    return prefs.containsKey(key);
  }

  Future<void> saveData(String key, String data) async {
    await prefs.setString(key, data);
  }
}
