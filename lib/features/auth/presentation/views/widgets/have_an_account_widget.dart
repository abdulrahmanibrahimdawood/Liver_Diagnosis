import 'package:e_commerce/core/utils/app_color.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HaveAnAccountWidget extends StatelessWidget {
  const HaveAnAccountWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Text.rich(
      TextSpan(
        children: [
          TextSpan(
            text: "You already have an account?",
            style: TextStyle(
              fontSize: 14.sp,
              fontFamily: 'Cairo',
              fontWeight: FontWeight.w600,
              color: const Color(0xFF949D9E),
            ),
          ),
          const TextSpan(
            text: ' ',
            style: TextStyle(
              color: Color(0xFF616A6B),
            ),
          ),
          TextSpan(
              recognizer: TapGestureRecognizer()
                ..onTap = () {
                  Navigator.pop(context);
                },
              text: ' Login now',
              style: TextStyle(
                color: AppColor.kPrimaryColor,
                fontSize: 14.sp,
                fontFamily: 'Cairo',
                fontWeight: FontWeight.w600,
              )),
        ],
      ),
      textAlign: TextAlign.center,
    );
  }
}
