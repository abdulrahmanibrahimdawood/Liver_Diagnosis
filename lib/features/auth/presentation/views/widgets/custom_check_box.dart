import 'package:e_commerce/core/utils/app_color.dart';
import 'package:e_commerce/core/utils/app_images.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CustomCheckBox extends StatelessWidget {
  const CustomCheckBox(
      {super.key, required this.isChecked, required this.onChecked});
  final bool isChecked;
  final ValueChanged<bool> onChecked;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        onChecked(!isChecked);
      },
      child: AnimatedContainer(
          width: 24.w,
          height: 24.h,
          duration: const Duration(
            milliseconds: 100,
          ),
          decoration: ShapeDecoration(
            color: isChecked ? AppColor.kPrimaryColor : Colors.white,
            shape: RoundedRectangleBorder(
              side: BorderSide(
                  width: 1.50.w,
                  color:
                      isChecked ? Colors.transparent : const Color(0xFFDCDEDE)),
              borderRadius: BorderRadius.circular(8.r),
            ),
          ),
          child: isChecked
              ? Padding(
                  padding: EdgeInsets.all(2.sp),
                  child: SvgPicture.asset(Assets.assetsImagesChecked),
                )
              : const SizedBox()),
    );
  }
}
