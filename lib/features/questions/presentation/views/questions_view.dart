import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:liver_diagnosis/core/widgets/app_bar_inside.dart';
import 'package:liver_diagnosis/features/questions/cubit/questions_cubit.dart';
import 'package:liver_diagnosis/features/questions/presentation/views/widgets/question_list_view.dart';

class QuesthionsView extends StatelessWidget {
  const QuesthionsView({super.key});
  static const routeName = 'questions';

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => QuestionsCubit()..fetchQuestions(),
      child: const Scaffold(
        body: SafeArea(
          child: Column(
            children: [
              CustomAppBarInside(
                text1: "Questions List",
              ),
              SizedBox(
                height: 12,
              ),
              Expanded(
                child: Padding(
                  padding: EdgeInsets.symmetric(vertical: 12),
                  child: QuestionsListView(),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
