import 'package:e_commerce/core/widgets/app_bar_inside.dart';
import 'package:e_commerce/features/questions/presentation/views/widgets/question_list_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:e_commerce/features/questions/cubit/questions_cubit.dart';

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
