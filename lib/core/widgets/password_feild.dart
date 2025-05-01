import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:liver_diagnosis/core/widgets/custom_text_form_feild.dart';

class PasswordFeild extends StatefulWidget {
  const PasswordFeild({
    super.key,
    this.controller,
  });
  final TextEditingController? controller;

  @override
  State<PasswordFeild> createState() => _PasswordFeildState();
}

class _PasswordFeildState extends State<PasswordFeild> {
  bool obscureText = true;
  @override
  Widget build(BuildContext context) {
    return CustomTextFormFeild(
      obscureText: obscureText,
      controller: widget.controller,
      suffixIcon: GestureDetector(
        onTap: () {
          setState(() {
            obscureText = !obscureText;
          });
        },
        child: obscureText
            ? Icon(
                Icons.remove_red_eye,
                color: Colors.blueGrey,
                size: 22.sp,
              )
            : Icon(
                Icons.visibility_off,
                color: Colors.blueGrey,
                size: 22.sp,
              ),
      ),
      icon: const Icon(Icons.lock, color: Colors.blueGrey),
      textInputType: TextInputType.visiblePassword,
      hintText: 'Password',
    );
  }
}
