import 'package:blog_app/app/widgets/post_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import '../../routes/app_pages.dart';
import 'home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({super.key});

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
              "Blog App",
              style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                    fontSize: 8.w,
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
                  size: 10.w,
                )),
          ],
        ),
      ),
      body: Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          Expanded(
            child: GetBuilder<HomeController>(
              builder: (value) {
                if (value.blogs.isNotEmpty) {
                  return ListView.builder(
                    controller: controller.scrollController,
                    itemCount: value.blogs.length,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: 3.w, vertical: 2.w),
                        child: Post(
                          model: value.blogs[index],
                        ),
                      );
                    },
                  );
                } else {
                  return const Center(
                    child: Text("How about writing a new blog?"),
                  );
                }
              },
            ),
          ),
          Obx(
            () {
              if (controller.isLoading.value) {
                return SizedBox(
                  height: 50.h,
                  child: const CircularProgressIndicator.adaptive(),
                );
              } else {
                return const SizedBox();
              }
            },
          )
        ],
      ),
      floatingActionButton: FloatingActionButton.extended(
        backgroundColor: Colors.green,
        onPressed: () {
          Get.toNamed(Routes.UPLOAD_BLOG);
        },
        label: Row(
          children: [
            const Icon(Icons.file_upload_rounded),
            SizedBox(width: 3.w),
            const Text("Upload Blog"),
          ],
        ),
      ),
    );
  }
}
