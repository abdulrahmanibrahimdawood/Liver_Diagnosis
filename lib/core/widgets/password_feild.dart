import 'package:e_commerce/core/widgets/custom_text_form_feild.dart';
import 'package:flutter/material.dart';

class PasswordFeild extends StatefulWidget {
  const PasswordFeild({
    super.key,
    this.onSaved,
    this.controller,
  });
  final void Function(String?)? onSaved;
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
      onSaved: (value) {
        widget.onSaved;
      },
      suffixIcon: GestureDetector(
        onTap: () {
          setState(() {
            obscureText = !obscureText;
          });
        },
        child: obscureText
            ? const Icon(Icons.remove_red_eye, color: Colors.blueGrey)
            : const Icon(Icons.visibility_off, color: Colors.blueGrey),
      ),
      icon: const Icon(Icons.lock, color: Colors.blueGrey),
      textInputType: TextInputType.visiblePassword,
      hintText: 'Password',
    );
  }
}
