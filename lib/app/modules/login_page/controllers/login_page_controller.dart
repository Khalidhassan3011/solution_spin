import '../../../common/util/exports.dart';
import '../../../models/contact_number.dart';
import '../../../models/number_format.dart';
import '../abstract/login_page_abstract.dart';

class LoginPageController extends GetxController implements LoginPageAbstract {
  RxBool visiblePassword = false.obs;

  Rx<ContactNumber> number =
      ContactNumber(Helper.data.numberFormat.first, "").obs;

  var tecEmail = TextEditingController().obs;
  var tecPassword = TextEditingController().obs;

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
  void onLoginPressed() {
    Get.offAllNamed(Routes.home);
  }

  @override
  void togglePasswordVisibility() {
    visiblePassword.value = !visiblePassword.value;
  }
}
