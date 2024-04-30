abstract interface class LoginRepository {
  String checkLogin(String login, String password);
  String createAccount(String login, String password);
}
