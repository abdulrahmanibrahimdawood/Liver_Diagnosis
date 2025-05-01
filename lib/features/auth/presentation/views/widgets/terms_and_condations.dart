import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:liver_diagnosis/features/auth/presentation/views/widgets/custom_check_box.dart';

class TermsAndCondationsWidgets extends StatefulWidget {
  const TermsAndCondationsWidgets({super.key, required this.onChanged});
  final ValueChanged<bool> onChanged;

  @override
  State<TermsAndCondationsWidgets> createState() =>
      _TermsAndCondationsWidgetsState();
}

class _TermsAndCondationsWidgetsState extends State<TermsAndCondationsWidgets> {
  bool isTermedAccepts = false;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CustomCheckBox(
          onChecked: (value) {
            isTermedAccepts = value;
            widget.onChanged(value);
            setState(() {});
          },
          isChecked: isTermedAccepts,
        ),
        SizedBox(width: 12.w),
        Expanded(
          child: Text.rich(
            TextSpan(
              children: [
                TextSpan(
                  text: 'By creating an account, you agree to ',
                  style: TextStyle(
                    color: const Color(0xFF949D9E),
                    fontSize: 13.sp,
                    fontFamily: 'Cairo',
                    fontWeight: FontWeight.w600,
                  ),
                ),
                TextSpan(
                  text: 'Our Terms and Conditions',
                  style: TextStyle(
                    color: const Color(0xFF4781BF),
                    fontSize: 13.sp,
                    fontFamily: 'Cairo',
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
            textAlign: TextAlign.left,
          ),
        ),
      ],
    );
  }
}
