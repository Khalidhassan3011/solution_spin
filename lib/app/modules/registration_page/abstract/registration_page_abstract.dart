import '../../../models/number_format.dart';

abstract class RegistrationPageAbstract {
  void onCountryCodeSelect(NumberFormat numberFormat);

  void togglePasswordVisibility();

  void onNextPressed();

  void onSubmitPressed();
}
