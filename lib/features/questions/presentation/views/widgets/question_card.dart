import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:liver_diagnosis/core/utils/app_color.dart';
import 'package:liver_diagnosis/features/checkout/data/models/questions_model.dart';

class QuestionCard extends StatelessWidget {
  const QuestionCard({
    required this.question,
    super.key,
  });
  final QuestionModel question;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(12.r),
      child: Container(
        width: 320.w,
        height: 130.h,
        padding: EdgeInsets.symmetric(horizontal: 7.w, vertical: 12.h),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(14.r),
          boxShadow: [
            BoxShadow(
              color: const Color(0x26000000),
              blurRadius: 6.r,
              offset: Offset(0, 2.h),
              spreadRadius: 2.r,
            ),
            BoxShadow(
              color: const Color(0x4C000000),
              blurRadius: 2.r,
              offset: Offset(0, 1.h),
              spreadRadius: 0,
            ),
          ],
        ),
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.only(top: 10.h),
              child: Text(
                '   ${question.question} ?',
                textAlign: TextAlign.center,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                  color: AppColor.kPrimaryColor,
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 10.h),
              child: Text(
                ' ${question.answer}.',
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
