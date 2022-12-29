import 'package:blog_app/app/modules/upload_blog/upload_blog_controller.dart';
import 'package:get/get.dart';

class UploadBlogBinding implements Bindings {
  //
  @override
  void dependencies() {
    Get.put(UploadBlogController());
  }
}
