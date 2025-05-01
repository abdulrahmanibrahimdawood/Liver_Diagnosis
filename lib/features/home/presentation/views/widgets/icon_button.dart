import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:liver_diagnosis/core/utils/app_color.dart';

class IconsButton extends StatelessWidget {
  const IconsButton({
    super.key,
    this.icon,
    this.onPressed,
    this.color,
    this.colorbox,
    this.hight,
    this.width,
  });
  final IconData? icon;
  final Color? color;
  final Color? colorbox;
  final double? hight;
  final double? width;

  final void Function()? onPressed;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: hight ?? 50.h,
      width: width ?? 50.h,
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
              blurRadius: 40.r,
              spreadRadius: 2.r,
              color: Colors.grey.withValues(alpha: 0.15)),
        ],
        color: colorbox ?? Colors.white,
        borderRadius: BorderRadius.circular(8.r),
      ),
      child: IconButton(
        onPressed: onPressed,
        icon: FaIcon(
          size: 22.sp,
          icon,
          color: color ?? AppColor.kPrimaryColor,
        ),
      ),
    );
  }
}
