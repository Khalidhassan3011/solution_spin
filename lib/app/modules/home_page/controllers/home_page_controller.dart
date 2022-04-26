import 'dart:async';

import 'package:get/get.dart';

class HomePageController extends GetxController {

  var time = DateTime.now().obs;

  @override
  void onInit() {
    super.onInit();

    Timer.periodic(const Duration(seconds: 1), (timer) {
      time.value = DateTime.now();
    });
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}

}
