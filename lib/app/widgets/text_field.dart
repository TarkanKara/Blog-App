import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class CustomTextField extends StatelessWidget {
  final TextEditingController controller;
  final String hintText, labelText;
  final bool isMultine;
  final int? maxTextLength;

  const CustomTextField({
    super.key,
    required this.controller,
    required this.hintText,
    required this.labelText,
    required this.isMultine,
    this.maxTextLength,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: isMultine ? 200.h : 10.h,
      width: double.infinity,
      padding: EdgeInsets.symmetric(horizontal: 3.h),
      child: TextField(
        maxLength: maxTextLength,
        maxLines: isMultine ? null : 1,
        controller: controller,
        keyboardType: isMultine ? TextInputType.multiline : null,
        decoration: InputDecoration(
          filled: true,
          fillColor: Colors.grey.shade200,
          hintText: hintText,
          labelText: labelText,
          border: const OutlineInputBorder(
            borderSide: BorderSide(color: Colors.grey),
          ),
        ),
      ),
    );
  }
}
