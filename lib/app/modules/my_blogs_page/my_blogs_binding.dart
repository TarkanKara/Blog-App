import 'package:blog_app/app/modules/my_blogs_page/my_blogs_controller.dart';
import 'package:get/get.dart';

class MyBlogsBinding implements Bindings {
  //
  @override
  void dependencies() {
    Get.put(MyBlogsController());
  }
}
