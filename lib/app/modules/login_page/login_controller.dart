// ignore_for_file: avoid_print, unused_field, non_constant_identifier_names

import 'package:blog_app/shared/services/firebase_auth.dart';
import 'package:blog_app/utils/indicator.dart';
import 'package:blog_app/utils/show_alert.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

import '../../routes/app_pages.dart';

class LoginController extends GetxController {
  //GestureRecognizer
  late GestureRecognizer _tapGestureRecognizer;

  //AuthService
  final AuthService _authService = AuthService();

  //TextEditingController
  TextEditingController login_email = TextEditingController();
  TextEditingController login_password = TextEditingController();

  @override
  void onInit() {
    print("LoginView yüklendi");
    _tapGestureRecognizer = TapGestureRecognizer()
      ..onTap = () => Get.toNamed(Routes.SIGNUP);
    super.onInit();
  }

  //onLoading
  Future<void> onLogin() async {
    if (login_email.text.isNotEmpty && login_password.text.isNotEmpty) {
      Indicator.showLoading();
      await _authService.login(login_email.text, login_password.text);
      Indicator.closeLoading();
    } else {
      print("Tüm alnları doldurunuz");
      showAlert("Tüm alnları doldurunuz");
    }
  }
}
