// ignore_for_file: avoid_print, unused_local_variable, no_leading_underscores_for_local_identifiers, unused_field

import 'dart:io';

import 'package:blog_app/app/models/blog_models.dart';
import 'package:blog_app/shared/services/firebase_functions.dart';
import 'package:blog_app/utils/indicator.dart';
import 'package:blog_app/utils/show_alert.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

import '../my_blogs_page/my_blogs_controller.dart';

class UploadBlogController extends GetxController {
  //FirebaseFunctions instance
  final FirebaseFunctions _functions = FirebaseFunctions();

  //
  @override
  void onInit() {
    print("Upload View Yüklendi");
    super.onInit();
  }

  //
  File? imageFile;
  TextEditingController title = TextEditingController();
  TextEditingController description = TextEditingController();

  //Select Image
  Future<void> selectImage() async {
    try {
      ImagePicker _select = ImagePicker();

      await _select.pickImage(source: ImageSource.gallery).then((value) {
        if (value != null) {
          imageFile = File(value.path);
          update();
        }
      });
    } catch (e) {
      showAlert("$e");
    }
  }

  //Create Blog
  Future<void> createBlog() async {
    if (title.text.isNotEmpty && description.text.isNotEmpty) {
      if (imageFile != null) {
        Indicator.showLoading();
        await _functions
            .uploadBlog(title.text, description.text, imageFile!)
            .then((value) {
          Indicator.closeLoading();
          showAlert("Blog Başarıyla Yüklendi");
          Get.back();
        });
      } else {
        showAlert("Lütfen bir resim seçiniz.");
      }
    } else {
      showAlert("Tüm Alanları Giriniz");
    }
  }

  //editBlog
  void editBlog(BlogsModel model) async {
    Indicator.showLoading();
    if (title.text.isNotEmpty && description.text.isNotEmpty) {
      if (imageFile == null) {
        Map<String, dynamic> map = {
          "title": title.text,
          "description": description.text,
        };
        await _functions.editBlog(model.id, map);
      } else {
        String imageUrl = await _functions.uploadImage(imageFile!);
        Map<String, dynamic> map = {
          "title": title.text,
          "description": description.text,
          "img": imageUrl,
        };
        await _functions.editBlog(model.id, map);
      }
    } else {
      showAlert("Tüm Alanlar Zorunludur");
    }
    Indicator.closeLoading();
    update();
  }

  //updateData
  void updateData() {
    Get.back();
    if (Get.isRegistered<MyBlogsController>()) {
      final controller = Get.find<MyBlogsController>();

      controller.myBlogs = [];
      Indicator.showLoading();
      controller.getMyBlogsData();
    }
  }
}
