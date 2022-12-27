import 'package:blog_app/app/modules/sign_up_page/sign_up_controller.dart';
import 'package:get/get.dart';

class SignUpBinding implements Bindings {
  //
  @override
  void dependencies() {
    Get.put(SignUpController());
  }
}
