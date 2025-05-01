import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:liver_diagnosis/features/questions/cubit/questions_cubit.dart';
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
                const Icon(
                  Icons.error_outline,
                  color: Colors.red,
                  size: 60,
                ),
                const SizedBox(height: 16),
                Text(
                  state.errMessage,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    color: Colors.red,
                    fontSize: 18,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const SizedBox(height: 16),
                ElevatedButton(
                  onPressed: () {
                    context.read<QuestionsCubit>().fetchQuestions();
                  },
                  child: const Text('Try Again'),
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
          return const Center(
            child: Text("No questions available."),
          );
        }
      },
    );
  }
}
