import 'package:blog_app/app/modules/my_blogs_page/my_blogs_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../routes/app_pages.dart';
import '../../widgets/post_widget.dart';

class MyBlogsView extends GetView<MyBlogsController> {
  const MyBlogsView({super.key});

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
              "My Blogs",
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
        children: [
          Expanded(
            child: GetBuilder<MyBlogsController>(
              builder: (value) {
                if (value.myBlogs.isNotEmpty) {
                  return ListView.builder(
                    itemCount: value.myBlogs.length,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: 3.w, vertical: 2.w),
                        child: Post(
                          model: value.myBlogs[index],
                        ),
                      );
                    },
                  );
                } else {
                  return const Center(
                    child: Text("No Blogs Availabe?"),
                  );
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}
