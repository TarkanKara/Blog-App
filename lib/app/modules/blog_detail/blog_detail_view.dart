// ignore_for_file: unused_local_variable

import 'package:blog_app/app/models/blog_models.dart';
import 'package:blog_app/app/modules/blog_detail/blog_detail_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../routes/app_pages.dart';

class BlogDetailView extends GetView<BlogDetailController> {
  const BlogDetailView({super.key});

  @override
  Widget build(BuildContext context) {
    final BlogsModel model = Get.arguments;
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.white,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "Blog Detail",
              style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                    fontSize: 6.w,
                    fontWeight: FontWeight.w500,
                  ),
            ),
            IconButton(
              onPressed: () {
                Get.toNamed(Routes.PROFILE);
              },
              icon: Icon(
                Icons.account_circle_rounded,
                color: Colors.black,
                size: 8.w,
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
      body: Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          Padding(
            padding: EdgeInsets.only(top: 3.h),
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 5.w),
              child: Text(
                model.title,
                style: Theme.of(context)
                    .textTheme
                    .bodyMedium!
                    .copyWith(fontSize: 5.w, fontWeight: FontWeight.w500),
              ),
            ),
          ),
          SizedBox(height: 1.h),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 5.w),
            child: Container(
              height: 25.h,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.green,
                image: DecorationImage(
                  image: NetworkImage(model.image),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          SizedBox(height: 1.h),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 5.w),
            alignment: Alignment.centerLeft,
            child: Text(
              model.description,
              style: Theme.of(context)
                  .textTheme
                  .bodyMedium!
                  .copyWith(fontSize: 5.w, fontWeight: FontWeight.w500),
            ),
          ),
        ],
      ),
    );
  }
}
