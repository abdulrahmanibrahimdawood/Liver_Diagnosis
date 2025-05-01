import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:liver_diagnosis/core/utils/app_color.dart';

class CustomTextDiagnosis extends StatelessWidget {
  const CustomTextDiagnosis(
      {super.key, required this.sufferFrom, required this.analysis});
  final String sufferFrom;
  final String analysis;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Align(
          alignment: Alignment.topLeft,
          child: Text(
            sufferFrom,
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14.sp),
          ),
        ),
        Row(
          children: [
            Text(
              'Do analysis ',
              style: TextStyle(fontSize: 14.sp),
            ),
            Text(
              analysis,
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: AppColor.kPrimaryColor,
                  fontSize: 14.sp),
            ),
          ],
        ),
      ],
    );
  }
}
