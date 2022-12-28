import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Indicator {
  //Loading
  static void showLoading() {
    Get.dialog(const Center(child: CircularProgressIndicator()));
  }

  //close
  static void closeLoading() {
    if (Get.isDialogOpen!) {
      Get.back();
    }
  }
}
