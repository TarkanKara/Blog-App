import 'package:blog_app/app/modules/home_page/home_controller.dart';
import 'package:get/get.dart';

class HomeBinding implements Bindings {
  //
  @override
  void dependencies() {
    Get.put(HomeController());
  }
}
