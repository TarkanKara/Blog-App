// ignore_for_file: avoid_print, unused_field, prefer_final_fields, unused_local_variable

import 'package:blog_app/shared/services/firebase_functions.dart';
import 'package:blog_app/utils/indicator.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../models/blog_models.dart';

class HomeController extends GetxController {
  //
  final FirebaseFunctions _functions = FirebaseFunctions();
  final ScrollController scrollController = ScrollController();
  List<BlogsModel> blogs = [];
  var isLoading = false.obs;

  //
  @override
  void onReady() {
    super.onReady();
    Indicator.showLoading();
  }

  //
  @override
  void onInit() {
    super.onInit();
    print("HomeView yüklendi");
    getData();
    _functions.isLoading.listen((p) {
      isLoading.value = p;
    });
    scrollController.addListener(() {
      double maxScrollPoint = scrollController.position.maxScrollExtent;
      double currentPosition = scrollController.position.pixels;
      double height20 = Get.size.height * 0.20;

      if (maxScrollPoint - currentPosition <= height20) {
        getData();
      }
    });
  }

  //getData Blogs
  void getData() async {
    blogs.addAll(await _functions.getBlogs());
    update();
  }
}
