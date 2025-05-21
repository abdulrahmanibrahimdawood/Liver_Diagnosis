import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:liver_diagnosis/core/widgets/app_bar_inside.dart';
import 'package:liver_diagnosis/core/widgets/custom_button.dart';
import 'package:liver_diagnosis/features/analysis/presentation/views/widgets/custom_text_feild_diagnosis.dart';
import 'package:liver_diagnosis/features/analysis/presentation/views/widgets/diagnosis_message.dart';
import 'package:liver_diagnosis/features/analysis/presentation/views/widgets/text_form_feild_to_analysis.dart';
import 'package:http/http.dart' as http;

class AnalysisViewBody extends StatefulWidget {
  const AnalysisViewBody({super.key});

  @override
  State<AnalysisViewBody> createState() => _AnalysisViewBodyState();
}

class _AnalysisViewBodyState extends State<AnalysisViewBody> {
  final TextEditingController ageController = TextEditingController();
  final TextEditingController genderController = TextEditingController();
  final TextEditingController altController = TextEditingController();
  final TextEditingController astController = TextEditingController();
  final TextEditingController totalProteinController = TextEditingController();
  final TextEditingController alpController = TextEditingController();
  final TextEditingController dbilController = TextEditingController();
  final TextEditingController albController = TextEditingController();

  Future<void> submitData() async {
    final age = ageController.text.isEmpty ? '0' : ageController.text;
    final gender =
        genderController.text.isEmpty ? 'Male' : genderController.text;
    final alt = altController.text.isEmpty ? '0' : altController.text;
    final ast = astController.text.isEmpty ? '0' : astController.text;
    final totalProtein =
        totalProteinController.text.isEmpty ? '0' : totalProteinController.text;
    final alp = alpController.text.isEmpty ? '0' : alpController.text;
    final dbil = dbilController.text.isEmpty ? '0' : dbilController.text;
    final alb = albController.text.isEmpty ? '0' : albController.text;

    final uri = Uri.parse('http://10.0.2.2:8000/predict').replace(
      queryParameters: {
        'Age': age,
        'Gender': gender,
        'SGPT_ALT': alt,
        'SGOT_AST': ast,
        'Total_Proteins': totalProtein,
        'Alkaline_Phosphatase': alp,
        'Direct_Bilirubin': dbil,
        'Albumin': alb,
      },
    );

    try {
      final response = await http.get(uri);

      if (response.statusCode == 200) {
        final Map<String, dynamic> jsonResult = json.decode(response.body);
        final String liverResult = jsonResult['Liver_Result'] ?? '';

        if (liverResult == 'Not a liver patient') {
          if (!mounted) return;
          DialogHelper.naturalMessage(context);
        } else if (liverResult == 'liver patient') {
          if (!mounted) return;

          DialogHelper.injeryMessage(context);
        } else {
          if (!mounted) return;

          showDialog(
            context: context,
            builder: (context) => AlertDialog(
              title: Text(
                'Unexpected result',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w700,
                ),
              ),
              content: Text(
                liverResult,
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 13.sp,
                  fontWeight: FontWeight.w700,
                ),
              ),
              actions: [
                TextButton(
                  onPressed: () => Navigator.pop(context),
                  child: Text(
                    'OK',
                    style: TextStyle(color: Colors.black, fontSize: 18.sp),
                  ),
                )
              ],
            ),
          );
        }
      } else {
        if (!mounted) return;

        showDialog(
          context: context,
          builder: (context) => AlertDialog(
            title: Text(
              'Error',
              style: TextStyle(
                color: Colors.black,
                fontSize: 16.sp,
                fontWeight: FontWeight.w700,
              ),
            ),
            content: Text(
              'Server responded with status: ${response.statusCode}',
              style: TextStyle(
                color: Colors.black,
                fontSize: 13.sp,
                fontWeight: FontWeight.w700,
              ),
            ),
            actions: [
              TextButton(
                onPressed: () => Navigator.pop(context),
                child: Text(
                  'OK',
                  style: TextStyle(color: Colors.black, fontSize: 18.sp),
                ),
              )
            ],
          ),
        );
      }
    } catch (e) {
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: Text(
            'Error',
            style: TextStyle(
              color: Colors.black,
              fontSize: 16.sp,
              fontWeight: FontWeight.w700,
            ),
          ),
          content: Text(
            'Failed to connect: $e',
            style: TextStyle(
              color: Colors.black,
              fontSize: 13.sp,
              fontWeight: FontWeight.w700,
            ),
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: Text(
                'OK',
                style: TextStyle(color: Colors.black, fontSize: 18.sp),
              ),
            )
          ],
        ),
      );
    }
  }

  @override
  void dispose() {
    ageController.dispose();
    genderController.dispose();
    altController.dispose();
    astController.dispose();
    totalProteinController.dispose();
    alpController.dispose();
    dbilController.dispose();
    albController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          const CustomAppBarInside(
            text1: "Labs",
          ),
          Padding(
            padding: EdgeInsets.all(16.r),
            child: Column(
              children: [
                const CustomTextDiagnosis(
                    sufferFrom: 'You should :-',
                    analysis: 'ALT & AST & Total Protien. '),
                SizedBox(height: 8.h),
                Row(
                  children: [
                    TextFormFeildAnalysis(
                      data: "Age",
                      color: Colors.black,
                      controller: ageController,
                    ),
                    SizedBox(width: 46.w),
                    TextFormFeildAnalysis(
                      keyboardType: TextInputType.text,
                      data: "Gender",
                      color: Colors.black,
                      controller: genderController,
                    ),
                    SizedBox(width: 46.w),
                    TextFormFeildAnalysis(
                      data: "ALT",
                      controller: altController,
                    ),
                  ],
                ),
                SizedBox(height: 18.h),
                Row(
                  children: [
                    TextFormFeildAnalysis(
                      data: "AST",
                      controller: astController,
                    ),
                    SizedBox(width: 46.w),
                    TextFormFeildAnalysis(
                      data: "T Protien",
                      controller: totalProteinController,
                    ),
                  ],
                ),
                SizedBox(height: 23.h),
                const CustomTextDiagnosis(
                    sufferFrom: 'IF you suffer from upper abdominal pain :-',
                    analysis: 'Alkaline Phosphataes.'),
                SizedBox(height: 8.h),
                Row(
                  children: [
                    TextFormFeildAnalysis(
                      data: "ALP",
                      controller: alpController,
                    ),
                  ],
                ),
                SizedBox(height: 23.h),
                const CustomTextDiagnosis(
                    sufferFrom: 'IF you suffer from jaundice :-',
                    analysis: 'Direct Bilirubin.'),
                SizedBox(height: 8.h),
                Row(
                  children: [
                    TextFormFeildAnalysis(
                      data: "DBIL",
                      controller: dbilController,
                    ),
                  ],
                ),
                SizedBox(height: 23.h),
                const CustomTextDiagnosis(
                    sufferFrom: 'IF you suffer from ascites :-',
                    analysis: 'Albumin.'),
                SizedBox(height: 8.h),
                Row(
                  children: [
                    TextFormFeildAnalysis(
                      data: "ALB",
                      controller: albController,
                    ),
                  ],
                ),
                SizedBox(height: 23.h),
                CustomButton(
                  text: "Submit",
                  onPressed: submitData,
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
