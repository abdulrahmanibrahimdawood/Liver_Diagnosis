import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:liver_diagnosis/features/questions/data/models/questions_model.dart';
import 'package:liver_diagnosis/features/questions/data/repos/questions_repo.dart';
import 'package:liver_diagnosis/features/questions/data/repos/questions_repo_impl.dart';

part 'question_state.dart';

class QuestionsCubit extends Cubit<QuestionsState> {
  QuestionsCubit() : super(QuestionsInitial());

  final QuestionRepo _questionRepo = QuestionRepoImpl();

  Future<void> fetchQuestions() async {
    emit(QuestionsLoading());
    try {
      final questions = await _questionRepo.getAllQuestions();
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
