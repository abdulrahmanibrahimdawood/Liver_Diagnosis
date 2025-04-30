import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class OrDivider extends StatelessWidget {
  const OrDivider({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Expanded(
          child: Divider(
            color: Color(0xffDCDEDE),
          ),
        ),
        SizedBox(
          width: 16.w,
        ),
        Text(
          'OR',
          textAlign: TextAlign.center,
          style: TextStyle(
            color: const Color(0xFFDCDEDE),
            fontSize: 18.sp,
            fontFamily: 'Cairo',
            fontWeight: FontWeight.w600,
          ),
        ),
        SizedBox(
          width: 16.w,
        ),
        const Expanded(
          child: Divider(
            color: Color(0xffDCDEDE),
          ),
        ),
      ],
    );
  }
}
