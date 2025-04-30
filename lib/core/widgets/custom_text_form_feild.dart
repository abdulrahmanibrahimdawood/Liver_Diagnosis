import 'package:e_commerce/core/utils/app_color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomTextFormFeild extends StatelessWidget {
  const CustomTextFormFeild(
      {super.key,
      required this.hintText,
      required this.textInputType,
      this.icon,
      this.suffixIcon,
      this.controller,
      this.obscureText = false});
  final String hintText;
  final TextInputType textInputType;
  final Widget? suffixIcon;
  final Widget? icon;
  final bool obscureText;
  final TextEditingController? controller;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: obscureText,
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Please enter your $hintText';
        }
        return null;
      },
      controller: controller,
      textAlignVertical: TextAlignVertical.center,
      textAlign: TextAlign.start,
      keyboardType: textInputType,
      decoration: InputDecoration(
        suffixIcon: suffixIcon,
        prefixIcon: icon,
        hintText: hintText,
        hintStyle: TextStyle(fontSize: 13.sp, color: Colors.blueGrey),
        filled: true,
        fillColor: AppColor.kPrimaryColor.withValues(alpha: 0.1),
        border: buildOutlineInputBorder(),
        enabledBorder: buildOutlineInputBorder(),
        focusedBorder: buildOutlineInputBorder(),
      ),
    );
  }

  OutlineInputBorder buildOutlineInputBorder() {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(4.0.r),
      borderSide: BorderSide(
        width: 1.w,
        color: Colors.grey,
      ),
    );
  }
}
