import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:liver_diagnosis/core/utils/app_color.dart';

class TextFormFeildAnalysis extends StatefulWidget {
  const TextFormFeildAnalysis({
    super.key,
    this.color = AppColor.kPrimaryColor,
    required this.data,
    this.controller,
    this.keyboardType = TextInputType.number,
  });
  final TextInputType? keyboardType;
  final Color? color;
  final String data;
  final TextEditingController? controller;

  @override
  State<TextFormFeildAnalysis> createState() => _TextFormFeildAnalysisState();
}

class _TextFormFeildAnalysisState extends State<TextFormFeildAnalysis> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Align(
          child: Text(
            widget.data,
            style: TextStyle(
              fontSize: 13.sp,
              color: widget.color ?? AppColor.kPrimaryColor,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        SizedBox(height: 4.h),
        Align(
          alignment: Alignment.topLeft,
          child: SizedBox(
            height: 30.h,
            width: 70.w,
            child: TextFormField(
              keyboardType: widget.keyboardType,
              controller: widget.controller,
              decoration: InputDecoration(
                contentPadding: EdgeInsets.only(bottom: 4.h, left: 10.h),
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
          ),
        ),
      ],
    );
  }
}
