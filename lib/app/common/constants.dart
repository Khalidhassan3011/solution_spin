class Constants {
  const Constants._();

  static const String baseUrl = 'http://user-api-dev.london-design-studios.com/api/v1';

  static const timeout = Duration(seconds: 120);
  static const String token = 'authToken';

  static _AppInfo get appInfo => _AppInfo();

  static _Language get language => _Language();

  static _External get external => _External();

  static _ArgumentsKeyword get argumentsKeyword => _ArgumentsKeyword();

  static _Value get value => _Value();
}

class _AppInfo {
  String appName = "Test Task";
  String appVersion = "0.0.0.1";
}

class _Language {
  String bangla = "bn";
  String english = "en";
}

class _External {
  String terms = "https://google.com";
}

class _ArgumentsKeyword {
}

class _Value {
  int resendCode = 120; // seconds
}
