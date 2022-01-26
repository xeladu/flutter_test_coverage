import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_test_coverage/login_service.dart';

void main() {
  test("Verify failed login with wrong user", () {
    var _sut = LoginService();
    expect(() => _sut.login("user", "abc123!?="), throwsException);
    expect(_sut.isLoggedIn(), isFalse);
  });

  test("Verify failed login with wrong password", () {
    var _sut = LoginService();
    expect(() => _sut.login("superUser", "password"), throwsException);
    expect(_sut.isLoggedIn(), isFalse);
  });

  test("Verify logout before login", () {
    var _sut = LoginService();
    _sut.login("superUser", "abc123!?=");
    expect(_sut.isLoggedIn(), isTrue);

    expect(() => _sut.login("superUser", "abc123!?="), throwsException);
    expect(_sut.isLoggedIn(), isTrue);
  });

  test("Verify successful login", () {
    var _sut = LoginService();
    _sut.login("superUser", "abc123!?=");
    expect(_sut.isLoggedIn(), isTrue);
  });

  test("Verify logout works", () {
    var _sut = LoginService();
    expect(_sut.isLoggedIn(), isFalse);

    _sut.login("superUser", "abc123!?=");
    expect(_sut.isLoggedIn(), isTrue);

    _sut.logout();
    expect(_sut.isLoggedIn(), isFalse);

    _sut.logout();
    expect(_sut.isLoggedIn(), isFalse);
  });
}
