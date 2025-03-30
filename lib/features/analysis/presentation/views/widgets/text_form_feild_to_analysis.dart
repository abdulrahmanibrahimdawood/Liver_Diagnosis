import 'package:e_commerce/core/utils/app_color.dart';
import 'package:flutter/material.dart';

class TextFormFeildAnalysis extends StatefulWidget {
  const TextFormFeildAnalysis(
      {super.key, this.color = AppColor.kPrimaryColor, required this.data});
  final Color? color;
  final String data;

  @override
  State<TextFormFeildAnalysis> createState() => _TextFormFeildAnalysisState();
}

class _TextFormFeildAnalysisState extends State<TextFormFeildAnalysis> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Align(
          child: Text(
            widget.data,
            style: TextStyle(
              fontSize: 15,
              color: widget.color ?? AppColor.kPrimaryColor,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        const SizedBox(
          height: 5,
        ),
        Align(
          alignment: Alignment.topLeft,
          child: SizedBox(
            height: 40,
            width: 90,
            child: TextFormField(
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide: const BorderSide(color: AppColor.kPrimaryColor),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide: const BorderSide(color: Colors.black),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide: const BorderSide(color: AppColor.kPrimaryColor),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
