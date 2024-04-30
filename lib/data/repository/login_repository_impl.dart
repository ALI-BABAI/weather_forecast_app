import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:weather_forecast_app/l10n/localization_without_context.dart';

import '../../domain/repository/login_repository.dart';

class LoginRepositoryImpl implements LoginRepository {
  LoginRepositoryImpl(this.storage);

  final FlutterSecureStorage storage;

  @override
  Future<bool> checkLogin(String login, String password) async {
    final isContainKey = await storage.containsKey(key: login);
    if (isContainKey) {
      final pswd = await storage.read(key: login);
      return (pswd == password);
    }
    return false;
  }

  @override
  Future<void> createAccount(String login, String password) async {
    try {
      final isContainKey = await storage.containsKey(key: login);
      if (isContainKey) {
        throw (tr.LoginErrorAccountAlreadyExists);
      }
      await storage.write(key: login, value: password);
    } catch (e) {
      rethrow;
    }
  }
}
