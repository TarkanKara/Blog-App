import 'package:blog_app/app/modules/upload_blog/upload_blog_controller.dart';
import 'package:blog_app/app/widgets/text_field.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class UploadBlogView extends GetView<UploadBlogController> {
  const UploadBlogView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.white,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "Create Blog",
              style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                    fontSize: 8.w,
                    fontWeight: FontWeight.w500,
                  ),
            ),
            IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.account_circle_rounded,
                color: Colors.black,
                size: 10.w,
              ),
            ),
          ],
        ),
        leading: IconButton(
          onPressed: () {
            Get.back();
          },
          icon: const Icon(
            Icons.arrow_back,
            color: Colors.black,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.only(top: 5.h),
          child: Column(
            children: [
              CustomTextField(
                maxTextLength: 25,
                isMultine: false,
                controller: TextEditingController(),
                hintText: "write something",
                labelText: "Title",
              ),
              SizedBox(height: 1.w),
              CustomTextField(
                controller: TextEditingController(),
                isMultine: true,
                hintText: "blog post",
                labelText: "Description",
              ),
            ],
          ),
        ),
      ),
    );
  }
}
