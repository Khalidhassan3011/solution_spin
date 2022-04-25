import '../../../models/number_format.dart';

abstract class LoginPageAbstract {
  void onCountryCodeSelect(NumberFormat numberFormat);

  void togglePasswordVisibility();

  void onLoginPressed();
}
