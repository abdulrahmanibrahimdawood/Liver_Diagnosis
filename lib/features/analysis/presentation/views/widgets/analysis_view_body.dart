import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:liver_diagnosis/core/widgets/app_bar_inside.dart';
import 'package:liver_diagnosis/core/widgets/custom_button.dart';
import 'package:liver_diagnosis/features/analysis/presentation/views/widgets/custom_text_feild_diagnosis.dart';
import 'package:liver_diagnosis/features/analysis/presentation/views/widgets/diagnosis_message.dart';
import 'package:liver_diagnosis/features/analysis/presentation/views/widgets/text_form_feild_to_analysis.dart';

class AnalysisViewBody extends StatelessWidget {
  const AnalysisViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          const CustomAppBarInside(
            text1: "Check Results",
          ),
          Padding(
            padding: EdgeInsets.all(16.r),
            child: Column(
              children: [
                const CustomTextDiagnosis(
                    sufferFrom: 'You should :-',
                    analysis: 'ALT & AST & Total Protien. '),
                SizedBox(
                  height: 8.h,
                ),
                Row(
                  children: [
                    const TextFormFeildAnalysis(
                      data: "Age",
                      color: Colors.black,
                    ),
                    SizedBox(
                      width: 46.w,
                    ),
                    const TextFormFeildAnalysis(
                      data: "Gender",
                      color: Colors.black,
                    ),
                    SizedBox(
                      width: 46.w,
                    ),
                    const TextFormFeildAnalysis(
                      data: "ALT",
                    ),
                  ],
                ),
                SizedBox(
                  height: 18.h,
                ),

                Row(
                  children: [
                    const TextFormFeildAnalysis(
                      data: "AST",
                    ),
                    SizedBox(
                      width: 46.w,
                    ),
                    const TextFormFeildAnalysis(
                      data: "T Protien",
                    ),
                  ],
                ),
                SizedBox(
                  height: 23.h,
                ),
                //==============================================================================================
                const CustomTextDiagnosis(
                    sufferFrom: 'IF you suffer from upper abdominal pain :-',
                    analysis: 'Alkaline Phosphataes.'),
                SizedBox(
                  height: 8.h,
                ),
                const Row(
                  children: [
                    TextFormFeildAnalysis(
                      data: "ALP",
                    ),
                  ],
                ),
                SizedBox(
                  height: 23.h,
                ),
                //==========================================================================================================
                const CustomTextDiagnosis(
                    sufferFrom: 'IF you suffer from jaundice :-',
                    analysis: 'Direct Bilirubin.'),
                SizedBox(
                  height: 8.h,
                ),
                const Row(
                  children: [
                    TextFormFeildAnalysis(
                      data: "DBIL",
                    ),
                  ],
                ),
                SizedBox(
                  height: 23.h,
                ),
                //==========================================================================================================
                const CustomTextDiagnosis(
                    sufferFrom: 'IF you suffer from ascites :-',
                    analysis: 'Albumin.'),
                SizedBox(
                  height: 8.h,
                ),
                const Row(
                  children: [
                    TextFormFeildAnalysis(
                      data: "ALB",
                    ),
                  ],
                ),
                SizedBox(
                  height: 23.h,
                ),
                CustomButton(
                  text: "Submit",
                  onPressed: () {
                    DialogHelper.naturalMessage(context);
                  },
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
