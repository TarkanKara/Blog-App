// ignore_for_file: avoid_print, unused_field

import 'package:blog_app/app/models/blog_models.dart';
import 'package:blog_app/shared/services/firebase_functions.dart';
import 'package:blog_app/utils/indicator.dart';
import 'package:get/get.dart';

import '../../routes/app_pages.dart';

class MyBlogsController extends GetxController {
  //
  final FirebaseFunctions _functions = FirebaseFunctions();
  List blogsId = [];
  List<BlogsModel> myBlogs = [];

  //
  @override
  void onInit() {
    print("My Blogs Page Yüklendi");
    super.onInit();
    getMyBlogsData();
  }

  //
  @override
  void onReady() {
    super.onReady();
    Indicator.showLoading();
  }

  //getMyBlogsData
  void getMyBlogsData() async {
    blogsId = await _functions.getMyBlogs();

    if (blogsId.isNotEmpty) {
      for (var i = 0; i < blogsId.length; i++) {
        BlogsModel model = await _functions.getBlogsById(blogsId[i]);

        myBlogs.add(model);
      }
    }
    update();
    Indicator.closeLoading();
  }

  //deleteBlog
  void deleteBlog(String id) async {
    Indicator.showLoading();

    await _functions.deleteBlog(id).then((value) {
      myBlogs = [];
      getMyBlogsData();
    });

    Indicator.closeLoading();
  }

  //editBlog
  void editBlog(BlogsModel model) async {
    Get.toNamed(Routes.UPLOAD_BLOG, arguments: model);
  }
}
