import 'package:blog_app/app/modules/upload_blog/upload_blog_controller.dart';
import 'package:blog_app/app/widgets/custom_button.dart';
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
                controller: controller.title,
                hintText: "write something",
                labelText: "Title",
              ),
              SizedBox(height: 1.w),
              CustomTextField(
                controller: controller.description,
                isMultine: true,
                hintText: "blog post",
                labelText: "Description",
              ),
              SizedBox(height: 1.w),
              Container(
                height: 20.h,
                width: 150.w,
                alignment: Alignment.center,
                child: GetBuilder<UploadBlogController>(
                  builder: (controller) {
                    if (controller.imageFile != null) {
                      return Image.file(controller.imageFile!);
                    } else {
                      return CustomButton(
                        icon: Icons.upload_file_rounded,
                        title: "Upload Image",
                        function: () {
                          controller.selectImage();
                        },
                      );
                    }
                  },
                ),
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: Container(
        height: 15.h,
        width: double.infinity,
        alignment: Alignment.bottomRight,
        child: CustomButton(
          icon: Icons.upload,
          title: "CREATE BLOG",
          function: () {
            controller.createBlog();
          },
        ),
      ),
    );
  }
}
