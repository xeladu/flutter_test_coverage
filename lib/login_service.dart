class LoginService {
  final String _expectedPassword = "abc123!?=";
  final String _expectedUser = "superUser";

  bool _isLoggedIn = false;

  void login(String? user, String? password) {
    if (_isLoggedIn) throw Exception("Please log out first");

    if (user != _expectedUser) throw Exception("Wrong user name");
    if (password != _expectedPassword) throw Exception("Wrong password");

    _isLoggedIn = true;
  }

  void logout() {
    _isLoggedIn = false;
  }

  bool isLoggedIn() {
    return _isLoggedIn;
  }
}
