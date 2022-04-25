import 'package:get/get.dart';

import '../modules/home_page/bindings/home_page_binding.dart';
import '../modules/home_page/views/home_page_view.dart';
import '../modules/login_page/bindings/login_page_binding.dart';
import '../modules/login_page/views/login_page_view.dart';
import '../modules/registration_page/bindings/registration_page_binding.dart';
import '../modules/registration_page/views/registration_page_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const initial = Routes.login;

  static final routes = [
    GetPage(
      name: _Paths.registration,
      page: () => const RegistrationPageView(),
      binding: RegistrationPageBinding(),
    ),
    GetPage(
      name: _Paths.login,
      page: () => LoginPageView(),
      binding: LoginPageBinding(),
    ),
    GetPage(
      name: _Paths.home,
      page: () => HomePageView(),
      binding: HomePageBinding(),
    ),
  ];
}
