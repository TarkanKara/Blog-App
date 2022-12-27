import 'package:blog_app/app/modules/login_page/login_controller.dart';
import 'package:get/get.dart';

class LoginBinding implements Bindings {
  //
  @override
  void dependencies() {
    Get.put(LoginController());
  }
}
