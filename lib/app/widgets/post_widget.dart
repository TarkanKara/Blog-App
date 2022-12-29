import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../routes/app_pages.dart';

class Post extends StatelessWidget {
  const Post({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Get.toNamed(Routes.BLOG_DETAIL_VIEW);
      },
      child: Material(
        elevation: 8,
        borderRadius: BorderRadius.circular(10),
        child: SizedBox(
          height: 50.h,
          child: Column(
            children: [
              //Image
              Container(
                height: 25.h,
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(15),
                    topRight: Radius.circular(15),
                  ),
                  image: DecorationImage(
                    image: NetworkImage("https://picsum.photos/536/354"),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              SizedBox(height: 1.h),
              Text(
                "Blog Post Title",
                overflow: TextOverflow.ellipsis,
                maxLines: 2,
                style: Theme.of(context).textTheme.bodyText1!.copyWith(
                      fontSize: 5.w,
                      fontWeight: FontWeight.w500,
                    ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
