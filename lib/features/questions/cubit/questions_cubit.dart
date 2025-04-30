import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:e_commerce/features/checkout/data/models/questions_model.dart';
import 'package:e_commerce/features/questions/services/get_all_questions.dart';

part 'question_state.dart';

class QuestionsCubit extends Cubit<QuestionsState> {
  QuestionsCubit() : super(QuestionsInitial());

  final AllQuestionsServices _questionsServices = AllQuestionsServices();

  Future<void> fetchQuestions() async {
    emit(QuestionsLoading());
    try {
      final questions = await _questionsServices.getAllQuestions();
      if (questions.isEmpty) {
        emit(QuestionsFailure('No questions found.'));
      } else {
        emit(QuestionsSuccess(questions));
      }
    } catch (e) {
      if (e.toString().contains('No internet connection')) {
        emit(QuestionsFailure(
            'No internet connection. Please check your connection and try again.'));
      } else {
        emit(QuestionsFailure(
            'Failed to load questions. Please try again later.'));
      }
    }
  }
}
