import 'package:blog_app/app/modules/my_favourite_page/my_favourite_controller.dart';
import 'package:get/get.dart';

class MyFavouriteBinding implements Bindings {
  //
  @override
  void dependencies() {
    Get.put(MyFavouriteController());
  }
}
