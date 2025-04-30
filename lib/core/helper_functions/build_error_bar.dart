import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void buildErrorBar(BuildContext context, String message) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Text(
        message,
        style: TextStyle(fontSize: 12.sp),
      ),
    ),
  );
}
