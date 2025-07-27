// lib/features/questions/data/repositories/question_repo_impl.dart

import 'package:liver_diagnosis/core/helper_functions/api.dart';
import 'package:liver_diagnosis/features/questions/data/models/questions_model.dart';
import 'package:liver_diagnosis/features/questions/data/repos/questions_repo.dart';

class QuestionRepoImpl implements QuestionRepo {
  @override
  Future<List<QuestionModel>> getAllQuestions() async {
    Map<String, dynamic> response = await Api().get(
      url:
          'https://2fc9b7c9c94f.ngrok-free.app/projectq-main/project/questions/process.php',
      token: null,
    );

    List<dynamic> data = response['data'];
    List<QuestionModel> questionList =
        data.map((json) => QuestionModel.fromJson(json)).toList();

    return questionList;
  }
}
