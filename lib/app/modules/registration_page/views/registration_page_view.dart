import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/registration_page_controller.dart';

class RegistrationPageView extends GetView<RegistrationPageController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('RegistrationPageView'),
        centerTitle: true,
      ),
      body: Center(
        child: Text(
          'RegistrationPageView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
