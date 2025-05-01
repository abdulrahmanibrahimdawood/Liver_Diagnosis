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
      height: hight ?? 60,
      width: width ?? 60,
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
              blurRadius: 40,
              spreadRadius: 2,
              color: Colors.grey.withValues(alpha: 0.15)),
        ],
        color: colorbox ?? Colors.white,
        borderRadius: BorderRadius.circular(8.r),
      ),
      child: IconButton(
        onPressed: onPressed,
        icon: FaIcon(
          icon,
          color: color ?? AppColor.kPrimaryColor,
        ),
      ),
    );
  }
}
