import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:liver_diagnosis/core/utils/app_color.dart';
import 'package:liver_diagnosis/features/checkout/data/models/advice_model.dart';

class AdviceCard extends StatelessWidget {
  const AdviceCard({
    required this.advice,
    super.key,
  });
  final AdviceModel advice;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(right: 9.w, left: 9.w),
      child: Container(
        height: 270.h,
        decoration: BoxDecoration(
          color: AppColor.kPrimaryColor.withValues(alpha: .5),
          borderRadius: BorderRadius.circular(10.r),
        ),
        width: MediaQuery.of(context).size.width * 0.90,
        child: Padding(
          padding: EdgeInsets.all(12.r),
          child: Column(
            children: [
              SizedBox(
                height: 14.h,
              ),
              Text(
                advice.title,
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 19.sp),
                textAlign: TextAlign.center,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
              SizedBox(height: 13.h),
              SizedBox(
                height: 130.h,
                width: 130.w,
                child: Image.network(
                  advice.image,
                  fit: BoxFit.contain,
                  errorBuilder: (context, error, stackTrace) => Icon(
                    Icons.image_not_supported,
                    color: Colors.grey,
                    size: 14.sp,
                  ),
                ),
              ),
              SizedBox(
                height: 16.h,
              ),
              Text(
                advice.description,
                textAlign: TextAlign.center,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(fontSize: 13.sp, fontWeight: FontWeight.w600),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
