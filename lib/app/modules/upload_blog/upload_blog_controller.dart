// ignore_for_file: avoid_print, unused_local_variable, no_leading_underscores_for_local_identifiers

import 'dart:io';

import 'package:blog_app/utils/show_alert.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class UploadBlogController extends GetxController {
  //
  @override
  void onInit() {
    print("Upload View Yüklendi");
    super.onInit();
  }

  File? imageFile;

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
}
