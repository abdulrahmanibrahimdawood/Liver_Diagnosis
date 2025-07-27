import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:http/http.dart' as http;
import 'package:liver_diagnosis/core/widgets/app_bar_inside.dart';
import 'package:liver_diagnosis/core/widgets/custom_button.dart';
import 'package:liver_diagnosis/features/analysis/presentation/views/widgets/custom_text_feild_diagnosis.dart';
import 'package:liver_diagnosis/features/analysis/presentation/views/widgets/diagnosis_message.dart';
import 'package:liver_diagnosis/features/analysis/presentation/views/widgets/text_form_feild_to_analysis.dart';
import 'package:liver_diagnosis/features/analysis/presentation/views/widgets/text_form_feild_validator.dart';

class AnalysisViewBody extends StatefulWidget {
  const AnalysisViewBody({super.key});

  @override
  State<AnalysisViewBody> createState() => _AnalysisViewBodyState();
}

class _AnalysisViewBodyState extends State<AnalysisViewBody> {
  final _formKey = GlobalKey<FormState>();

  final TextEditingController ageController = TextEditingController();
  final TextEditingController genderController = TextEditingController();
  final TextEditingController altController = TextEditingController();
  final TextEditingController astController = TextEditingController();
  final TextEditingController totalProteinController = TextEditingController();
  final TextEditingController alpController = TextEditingController();
  final TextEditingController dbilController = TextEditingController();
  final TextEditingController albController = TextEditingController();

  /// helper function to convert empty inputs to "0"
  String cleanInput(String? input) {
    return input?.trim().isEmpty ?? true ? '0' : input!.trim();
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
          const CustomAppBarInside(text1: "Labs"),
          Padding(
            padding: EdgeInsets.all(16.r),
            child: Form(
              key: _formKey,
              child: Column(
                children: [
                  const CustomTextDiagnosis(
                    sufferFrom: 'You should :-',
                    analysis: 'ALT & AST & Total Protien.',
                  ),
                  SizedBox(height: 8.h),
                  Row(
                    children: [
                      TextFormFeildvaidator(
                        data: "Age",
                        color: Colors.black,
                        controller: ageController,
                      ),
                      SizedBox(width: 46.w),
                      TextFormFeildvaidator(
                        keyboardType: TextInputType.text,
                        data: "Gender",
                        color: Colors.black,
                        controller: genderController,
                      ),
                      SizedBox(width: 46.w),
                      TextFormFeildvaidator(
                        data: "ALT",
                        controller: altController,
                      ),
                    ],
                  ),
                  SizedBox(height: 18.h),
                  Row(
                    children: [
                      TextFormFeildvaidator(
                        data: "AST",
                        controller: astController,
                      ),
                      SizedBox(width: 46.w),
                      TextFormFeildvaidator(
                        data: "T Protien",
                        controller: totalProteinController,
                      ),
                    ],
                  ),
                  SizedBox(height: 23.h),
                  const CustomTextDiagnosis(
                    sufferFrom: 'IF you suffer from upper abdominal pain :-',
                    analysis: 'Alkaline Phosphataes.',
                  ),
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
                    analysis: 'Direct Bilirubin.',
                  ),
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
                    analysis: 'Albumin.',
                  ),
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
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        submitData();
                      }
                    },
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Future<void> submitData() async {
    final uri = Uri.parse('http://10.0.2.2:8000/predict').replace(
      queryParameters: {
        'Age': cleanInput(ageController.text),
        'Gender': cleanInput(genderController.text),
        'SGPT_ALT': cleanInput(altController.text),
        'SGOT_AST': cleanInput(astController.text),
        'Total_Proteins': cleanInput(totalProteinController.text),
        'Alkaline_Phosphatase': cleanInput(alpController.text),
        'Direct_Bilirubin': cleanInput(dbilController.text),
        'Albumin': cleanInput(albController.text),
      },
    );

    try {
      final response = await http.get(uri);

      if (response.statusCode == 200) {
        final Map<String, dynamic> jsonResult = json.decode(response.body);
        final String liverResult = jsonResult['Liver_Result'] ?? '';

        if (!mounted) return;

        if (liverResult == 'Not a liver patient') {
          DialogHelper.naturalMessage(context);
        } else if (liverResult == 'liver patient') {
          DialogHelper.injeryMessage(context);
        } else {
          showDialog(
            context: context,
            builder: (context) => AlertDialog(
              title: Text('Unexpected result',
                  style:
                      TextStyle(fontSize: 16.sp, fontWeight: FontWeight.w700)),
              content: Text(liverResult,
                  style:
                      TextStyle(fontSize: 13.sp, fontWeight: FontWeight.w700)),
              actions: [
                TextButton(
                  onPressed: () => Navigator.pop(context),
                  child: Text('OK', style: TextStyle(fontSize: 18.sp)),
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
            title: Text('Error',
                style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.w700)),
            content: Text(
                'Server responded with status: ${response.statusCode}',
                style: TextStyle(fontSize: 13.sp)),
            actions: [
              TextButton(
                onPressed: () => Navigator.pop(context),
                child: Text('OK', style: TextStyle(fontSize: 18.sp)),
              )
            ],
          ),
        );
      }
    } catch (e) {
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: Text('Error',
              style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.w700)),
          content:
              Text('Failed to connect: $e', style: TextStyle(fontSize: 13.sp)),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: Text('OK', style: TextStyle(fontSize: 18.sp)),
            )
          ],
        ),
      );
    }
  }
}
