part of 'app_pages.dart';

abstract class Routes {
  Routes._();
  static const registration = _Paths.registration;
  static const login = _Paths.login;
}

abstract class _Paths {
  _Paths._();
  static const registration = '/registration-page';
  static const login = '/login-page';
}
