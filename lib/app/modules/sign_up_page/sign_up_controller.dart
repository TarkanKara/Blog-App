// ignore_for_file: avoid_print, unused_field, non_constant_identifier_names

import 'package:blog_app/shared/services/firebase_auth.dart';
import 'package:blog_app/shared/services/firebase_functions.dart';
import 'package:blog_app/utils/indicator.dart';
import 'package:blog_app/utils/show_alert.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class SignUpController extends GetxController {
  //AutService & FirebaseFunctios instance
  final AuthService _authService = AuthService();
  final FirebaseFunctions _functions = FirebaseFunctions();

  //TextEditingController
  final TextEditingController user_name = TextEditingController();
  final TextEditingController email = TextEditingController();
  final TextEditingController password = TextEditingController();

  //
  @override
  void onInit() {
    print("SignUpView yüklendi");
    super.onInit();
  }

  //Users Account
  void onCreateAccount() async {
    if (user_name.text.isNotEmpty &&
        email.text.isNotEmpty &&
        password.text.isNotEmpty) {
      Indicator.showLoading();
      await _authService.createAccount(email.text, password.text).then(
          (value) =>
              _functions.createUserCredential(user_name.text, email.text));
    } else {
      showAlert("Tüm Alanları Giriniz");
      print("Tüm Alanları Giriniz");
    }
  }
}
