import '../../../common/util/exports.dart';
import '../../../common/widgets/my_input_field.dart';
import '../controllers/login_page_controller.dart';

class LoginPageView extends GetView<LoginPageController> {
  const LoginPageView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: Utils.appExitConfirmation,
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: Column(
          children: [
            // logo, title, hints
            _header,

            // field, forgot
            _body,

            // registration link
            _footer
          ],
        ),
      ),
    );
  }

  Widget get _header => Expanded(
    flex: 3,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // icon
            _icon,

            SizedBox(height: 5.h),

            // title
            _title,

            SizedBox(height: 5.h),

            // hints
            _hints,
          ],
        ),
      );

  Widget get _icon => Image.asset(
        AppAssets.image.icon,
        height: 60,
        width: 60,
      );

  Widget get _title => Text(
        "welcomeBack".tr,
        style: Style.textStyle.title.copyWith(
          color: Colors.black,
          fontSize: 20,
        ),
      );

  Widget get _hints => Text(
        "continueHints".tr,
        style: Style.textStyle.hints,
      );

  Widget get _body => Expanded(
    flex: 3,
        child: Container(
          margin: const EdgeInsets.all(16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // email
              MyInputField.heading("email".tr),

              MyInputField.inputField(
                controller.tecEmail.value,
                Icons.email_outlined,
              ),

              SizedBox(height: 16.h),

              // password
              MyInputField.heading("password".tr),

              Obx(
                () => MyInputField.password(
                  controller.tecPassword.value,
                  obscure: controller.visiblePassword.value,
                  onTap: controller.togglePasswordVisibility,
                ),
              ),

              SizedBox(height: 16.h),

              _forgotPassword,
            ],
          ),
        ),
      );

  Widget get _forgotPassword => Container(
        margin: const EdgeInsets.only(right: 8),
        child: Align(
          alignment: Alignment.centerRight,
          child: Text(
            "forgotPassword".tr,
            style: Style.textStyle.fieldHeading.copyWith(
              color: Colors.blue,
            ),
          ),
        ),
      );

  Widget get _footer => Expanded(
    flex: 4,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [_loginBtn, _registerLink],
        ),
      );

  Widget get _loginBtn => Container(
        margin: const EdgeInsets.symmetric(horizontal: 32),
        width: double.infinity,
        child: ElevatedButton(
          onPressed: controller.onLoginPressed,
          child: Text(
            "signin".tr,
          ),
        ),
      );

  Widget get _registerLink => Container(
        margin: const EdgeInsets.only(bottom: 32),
        child: TextButton(
          onPressed: controller.accountCreateLink,
          child: Text(
            "createAccount".tr,
            style: Style.textStyle.fieldHeading.copyWith(
              color: Colors.blue,
            ),
          ),
        ),
      );
}
