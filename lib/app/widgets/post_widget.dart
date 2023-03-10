import 'package:blog_app/app/models/blog_models.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../routes/app_pages.dart';

class Post extends StatelessWidget {
  final BlogsModel model;
  final Function? edit, delete;
  final bool isPopUpMenuEnabled;
  const Post({
    super.key,
    required this.model,
    this.edit,
    this.delete,
    required this.isPopUpMenuEnabled,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Get.toNamed(Routes.BLOG_DETAIL_VIEW, arguments: model);
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
                decoration: BoxDecoration(
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(15),
                    topRight: Radius.circular(15),
                  ),
                  image: DecorationImage(
                    image: NetworkImage(model.image),
                    fit: BoxFit.cover,
                  ),
                ),
                alignment: Alignment.topRight,
                child: isPopUpMenuEnabled
                    ? Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: PopupMenuButton(
                          onSelected: (value) {
                            if (value == 0) {
                              edit!();
                            } else if (value == 1) {
                              delete!();
                            }
                          },
                          child: const Icon(
                            Icons.more_vert,
                            color: Colors.white,
                          ),
                          itemBuilder: (context) => [
                            const PopupMenuItem(
                              value: 0,
                              child: Text("Edit"),
                            ),
                            const PopupMenuItem(
                              value: 1,
                              child: Text("Delete"),
                            ),
                          ],
                        ),
                      )
                    : const SizedBox(),
              ),
              SizedBox(height: 1.h),
              Text(
                model.title,
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
