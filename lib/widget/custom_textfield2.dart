import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:teqinvalleyproject/utils/custom_text.dart';

Widget CustomtextField({
  required bool obsecure,
  required Widget child,
  required TextEditingController controller,
  required String title,
  required String hint,
  required FormFieldValidator<String> validator, // Added validator parameter
}) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(
        title,
        style: AppTextStyle.pw400.copyWith(
          color: Colors.grey.shade600,
          fontSize: 16.px,
        ),
      ),
      SizedBox(height: 1.h),
      TextFormField(
        obscureText: obsecure,
        controller: controller,
        style: AppTextStyle.pw400.copyWith(
          fontSize: 14.px,
          color: Colors.grey.shade600,
        ),
        decoration: InputDecoration(
          contentPadding: EdgeInsets.symmetric(
            horizontal: 3.w,
            vertical: 1.h,
          ),
          suffixIcon: child,
          hintText: hint,
          errorStyle: AppTextStyle.pw400.copyWith(
            fontSize: 12.px,
            color: Colors.red,
          ),
          hintStyle: AppTextStyle.pw400.copyWith(
            fontSize: 14.px,
            color: Colors.grey.shade600,
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.px),
            borderSide: BorderSide(
              color: Colors.grey.shade400,
            ),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.px),
            borderSide: BorderSide(
              color: Colors.grey.shade400,
            ),
          ),
          errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.px),
            borderSide: BorderSide(
              color: Colors.red,
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.px),
            borderSide: BorderSide(
              color: Colors.grey.shade400,
            ),
          ),
        ),
        validator: validator, // Added validator here
      ),
    ],
  );
}
