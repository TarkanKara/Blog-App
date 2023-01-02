import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class TextTitle extends StatelessWidget {
  final IconData icon;
  final String title;
  final Function function;
  const TextTitle({
    super.key,
    required this.icon,
    required this.title,
    required this.function,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => function(),
      child: Padding(
        padding: EdgeInsets.only(left: 5.w, right: 5.w, top: 2.h),
        child: Material(
          elevation: 4,
          borderRadius: BorderRadius.circular(15),
          child: SizedBox(
            height: 10.h,
            width: 100.w,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Icon(icon, size: 20.sp),
                SizedBox(width: 15.w),
                Text(
                  title,
                  style: Theme.of(context)
                      .textTheme
                      .bodyMedium!
                      .copyWith(fontSize: 18.sp, fontWeight: FontWeight.bold),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
