import 'package:solution_spin/app/common/util/exports.dart';
import 'package:solution_spin/app/models/otp_number.dart';
import 'package:solution_spin/app/models/request/register_request.dart';
import 'package:solution_spin/app/models/request/register_send_request.dart';

import '../../../models/contact_number.dart';
import '../../../models/number_format.dart';
import '../../../models/response/register_send_response.dart';
import '../abstract/registration_page_abstract.dart';

class RegistrationPageController extends GetxController implements RegistrationPageAbstract  {

  final ApiHelper _apiHelper = Get.find();

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

  RegisterSendRequest? registerSendRequest;
  OtpNumber? otpNumber;

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
    Utils.closeKeyboard();
    if(_isValidInput()) {
      _sendOtp();
    }
  }

  @override
  void onSubmitPressed() {
    Utils.closeKeyboard();
    if(_isValidOtp()) {
      _register();
    }
  }

  @override
  void goBackPressed() {
    showOtp.value = false;
  }

  /// TODO not validate properly
  bool _isValidInput() {
    Utils.closeSnackbar();
    if(tecName.value.text.trim().isEmpty) {
      Utils.showSnackbar("Name can't empty");
      return false;
    }
    else if(tecEmail.value.text.trim().isEmpty) {
      Utils.showSnackbar("Email can't empty");
      return false;
    }
    else if(!tecEmail.value.text.trim().contains("@") || !tecEmail.value.text.trim().contains(".")) {
      Utils.showSnackbar("Invalid Email");
      return false;
    }
    else if(tecPhone.value.text.trim().isEmpty) {
      Utils.showSnackbar("Phone can't empty");
      return false;
    }
    else if(tecPassword.value.text.trim().isEmpty) {
      Utils.showSnackbar("Password can't empty");
      return false;
    }
    else if(tecConfirmPassword.value.text.trim().isEmpty) {
      Utils.showSnackbar("Confirm password can't empty");
      return false;
    }
    else if(tecPassword.value.text.trim() != tecConfirmPassword.value.text.trim()) {
      Utils.showSnackbar("Confirm Password does not match");
      return false;
    }

    return true;
  }

  bool _isValidOtp() {
    Utils.closeSnackbar();
    if(tecOtpEmail.value.text.trim().isEmpty) {
      Utils.showSnackbar("Email OTP can't empty");
      return false;
    }
    else if(tecOtpPhone.value.text.trim().isEmpty) {
      Utils.showSnackbar("Phone OTP can't empty");
      return false;
    }

    return true;
  }

  Future<void> _sendOtp() async {
    Utils.loadingDialog();

    registerSendRequest = RegisterSendRequest(
      number.value.numberFormat.countryCode+tecPhone.value.text.trim(),
      tecPassword.value.text.trim(),
      tecEmail.value.text.trim(),
      tecName.value.text.trim(),
      number.value.numberFormat.isoCode,
    );

    await _apiHelper.registerSend(registerSendRequest!).then((value) {
      RegisterSendResponse response = RegisterSendResponse.fromJson(value.body);
      Utils.closeDialog();

      if(value.isOk) {
        showOtp.value = true;
        Utils.showSnackbar("OTP send to your phone and email");
      } else if(response.statusCode == 400) {
        Utils.showSnackbar(response.errors!.first.msg);
      }
      else {
        Utils.showSnackbar("OTP send failed");
      }
    });
    Utils.closeDialog();
  }

  Future<void> _register() async {
    Utils.loadingDialog();

    RegisterRequest _request = RegisterRequest(
      registerSendRequest!,
      OtpNumber(
        tecOtpEmail.value.text.trim(),
        tecOtpPhone.value.text.trim(),
      ),
    );

    await _apiHelper.register(_request).then((value) {
      Utils.closeDialog();
      if(value.isOk) {
        Get.offAllNamed(Routes.login);
      } else if(value.statusCode == 400) {
        Utils.showSnackbar(value.body["message"]);
      }
      else {
        Utils.showSnackbar("Registration failed");
      }
    });
    Utils.closeDialog();
  }

}
