import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

AppBar buildAppBar(context, {required String title, Icon? icon}) {
  return AppBar(
    centerTitle: true,
    title: Text(
      title,
      style: TextStyle(
          fontSize: 20.sp,
          color: Colors.black,
          fontWeight: FontWeight.bold,
          fontFamily: 'Cairo'),
    ),
    leading: GestureDetector(
      onTap: () {
        Navigator.pop(context);
      },
      child: icon,
    ),
  );
}
