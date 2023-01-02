import 'package:blog_app/app/modules/my_favourite_page/my_favourite_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../routes/app_pages.dart';

class MyFavouriteView extends GetView<MyFavouriteController> {
  const MyFavouriteView({super.key});

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
              "My Favourite Blogs",
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
    );
  }
}
