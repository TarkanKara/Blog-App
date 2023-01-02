import 'package:blog_app/app/modules/profile_page/profile_controller.dart';
import 'package:get/get.dart';

class ProfileBinding implements Bindings {
  //
  @override
  void dependencies() {
    Get.put(ProfileController());
  }
}
