import 'package:get/get.dart';

import '../modules/login_page/bindings/login_page_binding.dart';
import '../modules/login_page/views/login_page_view.dart';
import '../modules/registration_page/bindings/registration_page_binding.dart';
import '../modules/registration_page/views/registration_page_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const initial = Routes.registration;

  static final routes = [
    GetPage(
      name: _Paths.registration,
      page: () => RegistrationPageView(),
      binding: RegistrationPageBinding(),
    ),
    GetPage(
      name: _Paths.login,
      page: () => LoginPageView(),
      binding: LoginPageBinding(),
    ),
  ];
}
