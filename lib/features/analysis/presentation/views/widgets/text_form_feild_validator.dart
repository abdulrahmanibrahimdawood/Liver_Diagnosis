import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:liver_diagnosis/core/utils/app_color.dart';

class TextFormFeildvaidator extends StatelessWidget {
  const TextFormFeildvaidator({
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
  Widget build(BuildContext context) {
    return FormField<String>(
      validator: (value) {
        if (controller?.text.isEmpty ?? true) {
          return 'Enter $data';
        }
        return null;
      },
      builder: (state) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              data,
              style: TextStyle(
                fontSize: 13.sp,
                color: color ?? AppColor.kPrimaryColor,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 4.h),
            SizedBox(
              height: 30.h,
              width: 70.w,
              child: TextFormField(
                controller: controller,
                keyboardType: keyboardType,
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.only(bottom: 4.h, left: 10.h),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8.r),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8.r),
                    borderSide: const BorderSide(color: Colors.black),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8.r),
                    borderSide: const BorderSide(color: AppColor.kPrimaryColor),
                  ),
                  errorBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8.r),
                    borderSide: const BorderSide(color: Colors.red),
                  ),
                  focusedErrorBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8.r),
                    borderSide: const BorderSide(color: Colors.red),
                  ),
                  errorText: null,
                ),
                onChanged: (_) {
                  state.didChange(controller?.text);
                },
              ),
            ),
            SizedBox(height: 4.h),
            Visibility(
              visible: state.hasError,
              maintainSize: true,
              maintainAnimation: true,
              maintainState: true,
              child: Text(
                state.errorText ?? '',
                style: TextStyle(
                  color: Colors.red,
                  fontSize: 10.sp,
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}
