import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:liver_diagnosis/features/questions/presentation/managers/questions_cubit/questions_cubit.dart';
import 'package:liver_diagnosis/features/questions/presentation/views/widgets/question_card.dart';

class QuestionsListView extends StatelessWidget {
  const QuestionsListView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<QuestionsCubit, QuestionsState>(
      builder: (context, state) {
        if (state is QuestionsLoading) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else if (state is QuestionsFailure) {
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.error_outline,
                  color: Colors.red,
                  size: 50.sp,
                ),
                SizedBox(height: 14.h),
                Text(
                  state.errMessage,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.red,
                    fontSize: 13.sp,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                SizedBox(height: 14.h),
                SizedBox(
                  height: 35.h,
                  width: 100.w,
                  child: ElevatedButton(
                    onPressed: () {
                      context.read<QuestionsCubit>().fetchQuestions();
                    },
                    child: Text(
                      'Try Again',
                      style: TextStyle(fontSize: 12.sp),
                    ),
                  ),
                ),
              ],
            ),
          );
        } else if (state is QuestionsSuccess) {
          return ListView.builder(
            itemCount: state.questions.length,
            physics: const BouncingScrollPhysics(),
            scrollDirection: Axis.vertical,
            itemBuilder: (context, index) {
              return QuestionCard(
                question: state.questions[index],
              );
            },
          );
        } else {
          return Center(
            child: Text(
              "No questions available.",
              style: TextStyle(fontSize: 12.sp),
            ),
          );
        }
      },
    );
  }
}
