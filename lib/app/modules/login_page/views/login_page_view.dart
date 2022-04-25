import '../../../common/util/exports.dart';
import '../../../common/widgets/my_input_field.dart';
import '../controllers/login_page_controller.dart';

class LoginPageView extends GetView<LoginPageController> {
  const LoginPageView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
    );
  }

  Widget get _header => Expanded(
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
        child: Container(
          margin: const EdgeInsets.all(16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  // country code
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      MyInputField.heading("countryCode".tr),
                      _countryCode,
                    ],
                  ),

                  SizedBox(width: 6.w),

                  // number
                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        MyInputField.heading("phone".tr),
                        MyInputField.inputField(
                          controller.tecEmail.value,
                          Icons.phone_android_outlined,
                        ),
                      ],
                    ),
                  ),
                ],
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

  Widget get _countryCode => GestureDetector(
        onTap: () {
          _selectCountryCode();
        },
        child: Container(
          height: 46.h,
          margin: EdgeInsets.symmetric(horizontal: 6.w),
          padding: EdgeInsets.symmetric(horizontal: 8.w),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(4),
            border: Border.all(width: 0, color: Colors.grey),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Obx(
                () => Text(
                  "${controller.number.value.numberFormat.countryName}   ${controller.number.value.numberFormat.countryCode}",
                ),
              ),
              SizedBox(width: 5.w),
              const Icon(
                Icons.keyboard_arrow_down_rounded,
                size: 20,
                color: Colors.grey,
              ),
            ],
          ),
        ),
      );

  void _selectCountryCode() {
    List<Widget> _items = [];

    for (var numberFormat in Helper.data.numberFormat) {
      _items.add(InkWell(
        onTap: () => controller.onCountryCodeSelect(numberFormat),
        child: ListTile(
          leading: Container(
            padding: const EdgeInsets.all(8),
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              color: AppColors.colorPrimary,
            ),
            child: Text(
              numberFormat.isoCode,
              style: const TextStyle(
                color: Colors.white,
              ),
            ),
          ),
          title: Text(
            numberFormat.countryName,
            style: const TextStyle(
              fontWeight: FontWeight.w500,
              letterSpacing: .5,
            ),
          ),
          subtitle: Text(
            numberFormat.countryCode,
            style: Style.textStyle.hints.copyWith(
              wordSpacing: 4,
            ),
          ),
        ),
      ));
    }

    Get.bottomSheet(
      Card(
        child: Container(
          height: 300,
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(25),
              topRight: Radius.circular(25),
            ),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.5),
                spreadRadius: 5,
                blurRadius: 7,
                offset: const Offset(0, 3),
              ),
            ],
          ),
          child: ListView(
            children: _items,
          ),
        ),
      ),
      barrierColor: Colors.transparent,
      isDismissible: true,
      enableDrag: true,
    );
  }

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
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [_loginBtn, _registerLink],
        ),
      );

  Widget get _loginBtn => Container(
        margin: const EdgeInsets.all(8),
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
        child: Text(
          "createAccount".tr,
          style: Style.textStyle.fieldHeading.copyWith(
            color: Colors.blue,
          ),
        ),
      );
}
