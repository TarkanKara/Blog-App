// ignore_for_file: avoid_print, unused_field, non_constant_identifier_names

import 'package:blog_app/shared/services/firebase_auth.dart';
import 'package:blog_app/utils/indicator.dart';
import 'package:blog_app/utils/show_alert.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class SignUpController extends GetxController {
  //AutService instance
  final AuthService _authService = AuthService();

  //
  final TextEditingController user_name = TextEditingController();
  final TextEditingController email = TextEditingController();
  final TextEditingController password = TextEditingController();

  //
  @override
  void onInit() {
    print("SignUpView yüklendi");
    super.onInit();
  }

  void onCreateAccount() async {
    if (user_name.text.isNotEmpty &&
        email.text.isNotEmpty &&
        password.text.isNotEmpty) {
      Indicator.showLoading();
      await _authService.createAccount(email.text, password.text);
      Indicator.closeLoading();
    } else {
      showAlert("Tüm Alanları Giriniz");
      print("Tüm Alanları Giriniz");
    }
  }
}
