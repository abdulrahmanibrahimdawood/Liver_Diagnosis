import 'package:e_commerce/core/utils/app_color.dart';
import 'package:flutter/material.dart';

class CustomTextDiagnosis extends StatelessWidget {
  const CustomTextDiagnosis(
      {super.key, required this.sufferFrom, required this.analysis});
  final String sufferFrom;
  final String analysis;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Align(
          alignment: Alignment.topLeft,
          child: Text(
            sufferFrom,
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
        ),
        Row(
          children: [
            const Text(
              'Do analysis ',
              style: TextStyle(),
            ),
            Text(
              analysis,
              style: const TextStyle(
                  fontWeight: FontWeight.bold, color: AppColor.kPrimaryColor),
            ),
          ],
        ),
      ],
    );
  }
}
