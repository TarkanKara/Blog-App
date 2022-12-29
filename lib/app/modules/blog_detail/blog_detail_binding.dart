import 'package:blog_app/app/modules/blog_detail/blog_detail_controller.dart';
import 'package:get/get.dart';

class BlogDetailBinding implements Bindings {
  //
  @override
  void dependencies() {
    Get.put(BlogDetailController());
  }
}
