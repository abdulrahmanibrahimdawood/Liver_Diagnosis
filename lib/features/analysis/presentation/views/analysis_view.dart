import 'package:e_commerce/core/widgets/app_bar_inside.dart';
import 'package:e_commerce/core/widgets/custom_button.dart';
import 'package:e_commerce/features/analysis/presentation/views/widgets/text_form_feild_to_analysis.dart';
import 'package:e_commerce/features/analysis/presentation/views/widgets/custom_text_feild_diagnosis.dart';
import 'package:flutter/material.dart';

class AnalysisView extends StatelessWidget {
  const AnalysisView({super.key});
  static const routeName = 'analysis';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              const CustomAppBarInside(
                text1: "Show Results",
              ),
              Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  children: [
                    const CustomTextDiagnosis(
                        sufferFrom: 'You should ...',
                        analysis: 'ALT & AST & Total Protien. '),
                    const SizedBox(
                      height: 10,
                    ),
                    const Row(
                      children: [
                        TextFormFeildAnalysis(
                          data: "Age",
                          color: Colors.black,
                        ),
                        SizedBox(
                          width: 50,
                        ),
                        TextFormFeildAnalysis(
                          data: "Gender",
                          color: Colors.black,
                        ),
                        SizedBox(
                          width: 50,
                        ),
                        TextFormFeildAnalysis(
                          data: "ALT",
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 20,
                    ),

                    const Row(
                      children: [
                        TextFormFeildAnalysis(
                          data: "AST",
                        ),
                        SizedBox(
                          width: 50,
                        ),
                        TextFormFeildAnalysis(
                          data: "T Protien",
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 25,
                    ),
                    //==============================================================================================
                    const CustomTextDiagnosis(
                        sufferFrom:
                            'IF you suffer from upper abdominal pain :-',
                        analysis: 'Alkaline Phosphataes.'),
                    const SizedBox(
                      height: 10,
                    ),
                    const Row(
                      children: [
                        TextFormFeildAnalysis(
                          data: "ALP",
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 25,
                    ),
                    //==========================================================================================================
                    const CustomTextDiagnosis(
                        sufferFrom: 'IF you suffer from jaundice :-',
                        analysis: 'Direct Bilirubin.'),
                    const SizedBox(
                      height: 10,
                    ),
                    const Row(
                      children: [
                        TextFormFeildAnalysis(
                          data: "DBIL",
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 25,
                    ),
                    //==========================================================================================================
                    const CustomTextDiagnosis(
                        sufferFrom: 'IF you suffer from ascites :-',
                        analysis: 'Albumin.'),
                    const SizedBox(
                      height: 10,
                    ),
                    const Row(
                      children: [
                        TextFormFeildAnalysis(
                          data: "ALB",
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 25,
                    ),
                    CustomButton(
                      text: "Submit",
                      onPressed: () {},
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
