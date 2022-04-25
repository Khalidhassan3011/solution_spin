import 'package:solution_spin/app/models/request/login_request.dart';

import '../../../common/util/exports.dart';
import '../abstract/login_page_abstract.dart';

class LoginPageController extends GetxController implements LoginPageAbstract {
  final ApiHelper _apiHelper = Get.find();

  RxBool visiblePassword = false.obs;

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
  void onLoginPressed() {
    Utils.closeKeyboard();
    if (_isValidInput()) {
      _login();
    }
  }

  @override
  void togglePasswordVisibility() {
    visiblePassword.value = !visiblePassword.value;
  }

  @override
  void accountCreateLink() {
    Get.offAllNamed(Routes.registration);
  }

  bool _isValidInput() {
    Utils.closeSnackbar();
    if (tecEmail.value.text.trim().isEmpty) {
      Utils.showSnackbar("Email can't empty");
      return false;
    } else if (tecPassword.value.text.trim().isEmpty) {
      Utils.showSnackbar("Password can't empty");
      return false;
    }

    return true;
  }

  Future<void> _login() async {
    Utils.loadingDialog();

    LoginRequest _loginRequest = LoginRequest(
      tecEmail.value.text.trim(),
      tecPassword.value.text.trim(),
    );

    await _apiHelper.login(_loginRequest).then((value) {
      Utils.closeDialog();
      if (value.isOk) {
        Get.offAllNamed(Routes.home);
      } else if (value.statusCode == 400) {
        Utils.showSnackbar(value.body["message"]);
      } else {
        Utils.showSnackbar("Login failed");
      }
    });
    Utils.closeDialog();
  }
}
