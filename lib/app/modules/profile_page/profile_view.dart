import 'package:blog_app/app/modules/profile_page/profile_controller.dart';
import 'package:blog_app/app/widgets/text_title.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../routes/app_pages.dart';

class ProfileView extends GetView<ProfileController> {
  const ProfileView({super.key});

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
              "Profile Page",
              style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                    fontSize: 6.w,
                    fontWeight: FontWeight.w500,
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
          Align(
            alignment: Alignment.center,
            child: Container(
              height: 15.h,
              width: 35.w,
              decoration: const BoxDecoration(
                color: Colors.black38,
                shape: BoxShape.circle,
              ),
              alignment: Alignment.center,
              child: Text(
                "T",
                style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                      fontSize: 15.w,
                      color: Colors.white,
                    ),
              ),
            ),
          ),
          SizedBox(height: 1.h),
          Text(
            "Tarkan",
            style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                  fontSize: 7.w,
                  color: Colors.black,
                ),
          ),
          TextTitle(
            icon: Icons.edit,
            title: "My Blogs",
            function: () {
              Get.toNamed(Routes.MY_BLOGS);
            },
          ),
          TextTitle(
            icon: Icons.favorite_outline_outlined,
            title: "Favourite",
            function: () {
              Get.toNamed(Routes.MY_FAVOURITE);
            },
          ),
          TextTitle(
            icon: Icons.logout,
            title: "Log Out",
            function: () {
              Get.toNamed(Routes.LOGIN);
            },
          ),
        ],
      ),
    );
  }
}
