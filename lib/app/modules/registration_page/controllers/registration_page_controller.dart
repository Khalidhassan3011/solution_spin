import 'package:solution_spin/app/common/util/exports.dart';

import '../../../models/contact_number.dart';
import '../../../models/number_format.dart';
import '../abstract/registration_page_abstract.dart';

class RegistrationPageController extends GetxController implements RegistrationPageAbstract  {

  RxBool showOtp = false.obs;

  RxBool visiblePassword = false.obs;

  final textFieldFocusNode = FocusNode();

  Rx<ContactNumber> number = ContactNumber(Helper.data.numberFormat.first, "").obs;

  var tecName = TextEditingController().obs;
  var tecEmail = TextEditingController().obs;
  var tecPhone = TextEditingController().obs;
  var tecPassword = TextEditingController().obs;
  var tecConfirmPassword = TextEditingController().obs;

  var tecOtpEmail = TextEditingController().obs;
  var tecOtpPhone = TextEditingController().obs;

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}

  @override
  void onCountryCodeSelect(NumberFormat numberFormat) {
    Get.back();
    number.value.numberFormat = numberFormat;
    number.refresh();
  }

  @override
  void togglePasswordVisibility() {
    visiblePassword.value = !visiblePassword.value;
  }

  @override
  void onNextPressed() {
    showOtp.value = true;
  }

  @override
  void onSubmitPressed() {
    Get.offAllNamed(Routes.login);
  }

}
