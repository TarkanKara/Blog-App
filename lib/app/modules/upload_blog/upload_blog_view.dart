import 'package:blog_app/app/modules/upload_blog/upload_blog_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/state_manager.dart';

class UploadBlogView extends GetView<UploadBlogController> {
  const UploadBlogView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Upload"),
      ),
    );
  }
}
