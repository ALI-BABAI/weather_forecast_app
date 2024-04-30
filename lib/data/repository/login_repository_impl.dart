import 'package:weather_forecast_app/l10n/localization_without_context.dart';

import '../../domain/repository/login_repository.dart';
import '../services/storage_service.dart';

class LoginRepositoryImpl implements LoginRepository {
  LoginRepositoryImpl(this.storageService);

  final StorageService storageService;

  @override
  bool checkLogin(String login, String password) {
    if (storageService.isContainKey(login)) {
      final pswd = storageService.getStoragedData(login);
      return (pswd == password);
    }
    return false;
  }

  @override
  Future<void> createAccount(String login, String password) async {
    try {
      if (storageService.isContainKey(login)) {
        throw (tr.LoginErrorAccountAlreadyExists);
      }
      await storageService.saveData(login, password);
    } catch (e) {
      rethrow;
    }
  }
}
