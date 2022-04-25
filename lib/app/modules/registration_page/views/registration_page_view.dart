import 'package:solution_spin/app/common/util/exports.dart';
import 'package:solution_spin/app/common/widgets/my_input_field.dart';

import '../controllers/registration_page_controller.dart';

class RegistrationPageView extends GetView<RegistrationPageController> {
  const RegistrationPageView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.colorPrimary,
      body: ListView(
        children: [
          _header,
          Container(
            decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(12),
                topRight: Radius.circular(12),
              ),
            ),
            child: Obx(
              () => controller.showOtp.value ? _showOtp : _registerField,
            ),
          ),
        ],
      ),
    );
  }

  Widget get _header => SizedBox(
        height: Get.height * .25,
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
        height: 50,
        width: 50,
      );

  Widget get _title => Text(
        "createYourAccount".tr,
        style: Style.textStyle.title,
      );

  Widget get _hints => Text(
        "registerHints".tr,
        style: Style.textStyle.hints,
      );

  // register fields
  Widget get _registerField => Container(
        height: Get.height * .75,
        padding: const EdgeInsets.all(16),
        child: ListView(
          shrinkWrap: true,
          physics: const ClampingScrollPhysics(),
          children: [
            // name
            MyInputField.heading("name".tr),

            MyInputField.inputField(
              controller.tecName.value,
              Icons.person_outline,
            ),

            SizedBox(height: 16.h),

            // email
            MyInputField.heading("email".tr),

            MyInputField.inputField(
              controller.tecEmail.value,
              Icons.email_outlined,
            ),

            SizedBox(height: 16.h),

            // country code and phone
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
                        controller.tecPhone.value,
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

            // Confirm password
            MyInputField.heading("confirmPassword".tr),

            Obx(
              () => MyInputField.password(
                controller.tecConfirmPassword.value,
                visibleSuffix: false,
              ),
            ),

            SizedBox(height: 16.h),

            _nextBtn,
          ],
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
                  "${controller.number.value.numberFormat.countryName}   +${controller.number.value.numberFormat.countryCode}",
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
            child: Text(numberFormat.isoCode, style: const TextStyle(
              color: Colors.white,
            ),),
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

  Widget get _nextBtn => Container(
        margin: const EdgeInsets.all(8),
        width: double.infinity,
        child: ElevatedButton(
          onPressed: controller.onNextPressed,
          child: Text(
            "next".tr,
          ),
        ),
      );

  // OTP fields
  Widget get _showOtp => Container(
    height: Get.height * .75,
    padding: EdgeInsets.symmetric(horizontal: Get.width * .2),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // name
        MyInputField.heading("emailOtp".tr),

        MyInputField.inputField(
          controller.tecOtpEmail.value,
          Icons.email_outlined,
        ),

        SizedBox(height: 16.h),

        // email
        MyInputField.heading("phoneOtp".tr),

        MyInputField.inputField(
          controller.tecOtpPhone.value,
          Icons.phone_android_outlined,
        ),

        SizedBox(height: 16.h),

        _submitButton,

        SizedBox(height: 16.h),

        _goBack,
      ],
    ),
  );

  Widget get _submitButton => Container(
    margin: const EdgeInsets.all(8),
    width: double.infinity,
    child: ElevatedButton(
      onPressed: controller.onSubmitPressed,
      child: Text(
        "confirm".tr,
      ),
    ),
  );

  Widget get _goBack => Obx(
    ()=> Visibility(
      visible: controller.showOtp.value,
      child: Center(
        child: TextButton(
          onPressed: controller.goBackPressed,
          child: Text("goBack".tr),
        ),
      ),
    ),
  );

}
