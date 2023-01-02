// ignore_for_file: avoid_print, unused_field

import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

import '../../routes/app_pages.dart';

class AuthenticationController extends GetxController {
  //
  final FirebaseAuth _auth = FirebaseAuth.instance;
  //
  @override
  void onInit() {
    print("Kullanıcı Girişi Var");
    super.onInit();
  }

  //
  @override
  void onReady() {
    super.onReady();
    isLoggedIn();
  }

  //isLoggedIn
  void isLoggedIn() {
    if (_auth.currentUser != null) {
      Get.toNamed(Routes.HOMEVIEW);
    } else {
      Get.toNamed(Routes.LOGIN);
    }
  }
}
