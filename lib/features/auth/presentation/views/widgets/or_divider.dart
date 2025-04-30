import 'package:flutter/material.dart';

class OrDivider extends StatelessWidget {
  const OrDivider({super.key});

  @override
  Widget build(BuildContext context) {
    return const Row(
      children: [
        Expanded(
          child: Divider(
            color: Color(0xffDCDEDE),
          ),
        ),
        SizedBox(
          width: 18,
        ),
        Text(
          'OR',
          textAlign: TextAlign.center,
          style: TextStyle(
            color: Color(0xFFDCDEDE),
            fontSize: 20,
            fontFamily: 'Cairo',
            fontWeight: FontWeight.w600,
          ),
        ),
        SizedBox(
          width: 18,
        ),
        Expanded(
          child: Divider(
            color: Color(0xffDCDEDE),
          ),
        ),
      ],
    );
  }
}
