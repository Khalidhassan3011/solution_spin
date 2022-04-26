import 'package:solution_spin/app/common/util/exports.dart';

class MyInputField {
  static Widget inputField(
    TextEditingController controller,
    IconData? suffixIcon,
  ) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 5),
      child: TextField(
        controller: controller,
        textAlignVertical: TextAlignVertical.center,
        decoration: Style.other.inputDecoration.copyWith(
          isCollapsed: true,
          suffixIcon: suffixIcon == null
              ? Container()
              : Icon(suffixIcon, color: Colors.grey),
        ),
      ),
    );
  }

  static Widget password(
    TextEditingController controller, {
    Function()? onTap,
    bool visibleSuffix = true,
    bool obscure = true,
  }) {
    return Container(
      height: 46.h,
      margin: EdgeInsets.symmetric(horizontal: 6.w),
      padding: EdgeInsets.symmetric(horizontal: 8.w),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(4),
        border: Border.all(width: 0, color: Colors.grey),
      ),
      child: Row(
        children: [
          Expanded(
            child: TextField(
              controller: controller,
              obscureText: obscure,
              decoration: Style.other.inputDecorationNone.copyWith(
                isCollapsed: true,
              ),
            ),
          ),
          Visibility(
            visible: visibleSuffix,
            child: IconButton(
              padding: EdgeInsets.zero,
              constraints: const BoxConstraints(),
              icon: Icon(
                  obscure
                      ? Icons.remove_red_eye_outlined
                      : Icons.visibility_off_outlined,
                  color: Colors.grey),
              onPressed: onTap,
            ),
          )
        ],
      ),
    );
  }

  static Widget heading(String title) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title, style: Style.textStyle.hints),
        SizedBox(height: 16.h),
      ],
    );
  }
}
