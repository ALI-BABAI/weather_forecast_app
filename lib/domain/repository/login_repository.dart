abstract interface class LoginRepository {
  bool checkLogin(String login, String password);
  Future<void> createAccount(String login, String password);
}
