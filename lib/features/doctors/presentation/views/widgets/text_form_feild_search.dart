import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:liver_diagnosis/core/utils/app_color.dart';

class TextFormFeildSearch extends StatelessWidget {
  const TextFormFeildSearch({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 8.h),
      child: TextFormField(
        decoration: InputDecoration(
          prefixIcon: Icon(
            Icons.search,
            size: 26.sp,
            color: const Color(0xFF4781C0),
          ),
          hintText: 'Search',
          contentPadding: EdgeInsets.symmetric(vertical: 9.w),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8.r),
            borderSide: const BorderSide(color: AppColor.kPrimaryColor),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8.r),
            borderSide: const BorderSide(color: Colors.black),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8.r),
            borderSide: const BorderSide(color: AppColor.kPrimaryColor),
          ),
        ),
      ),
    );
  }
}
