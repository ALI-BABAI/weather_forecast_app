import '../../domain/repository/login_repository.dart';
import '../services/storage_service.dart';

class LoginRepositoryImpl implements LoginRepository {
  LoginRepositoryImpl(this.storageService);

  final StorageService storageService;

  @override
  String checkLogin(String login, String password) {
    return '';
  }

  @override
  String createAccount(String login, String password) {
    return '';
  }
}
