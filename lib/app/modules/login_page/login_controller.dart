// ignore_for_file: avoid_print, unused_field

import 'package:flutter/gestures.dart';
import 'package:get/get.dart';

import '../../routes/app_pages.dart';

class LoginController extends GetxController {
  //
  late GestureRecognizer _tapGestureRecognizer;

  @override
  void onInit() {
    print("LoginView yüklendi");
    _tapGestureRecognizer = TapGestureRecognizer()
      ..onTap = () => Get.toNamed(Routes.SIGNUP);
    super.onInit();
  }
}
