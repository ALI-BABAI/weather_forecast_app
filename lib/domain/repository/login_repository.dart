abstract interface class LoginRepository {
  Future<bool> checkLogin(String login, String password);
  Future<void> createAccount(String login, String password);
}
