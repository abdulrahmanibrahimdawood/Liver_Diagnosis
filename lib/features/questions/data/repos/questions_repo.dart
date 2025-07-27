import 'package:liver_diagnosis/features/questions/data/models/questions_model.dart';

abstract class QuestionRepo {
  Future<List<QuestionModel>> getAllQuestions();
}
