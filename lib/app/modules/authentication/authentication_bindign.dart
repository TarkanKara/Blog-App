import 'package:blog_app/app/modules/authentication/authentication_controller.dart';
import 'package:get/get.dart';

class AuthenticationBinding implements Bindings {
  //
  @override
  void dependencies() {
    Get.put(AuthenticationController());
  }
}
