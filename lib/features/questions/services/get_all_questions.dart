import 'package:liver_diagnosis/core/helper_functions/api.dart';
import 'package:liver_diagnosis/features/checkout/data/models/questions_model.dart';

class AllQuestionsServices {
  Future<List<QuestionModel>> getAllQuestions() async {
    Map<String, dynamic> response = await Api().get(
      url:
          'https://26c6-156-197-156-110.ngrok-free.app/projectq-main/project/questions/process.php',
      token: null,
    );

    List<dynamic> data = response['data'];
    List<QuestionModel> questionList =
        data.map((json) => QuestionModel.fromJson(json)).toList();

    return questionList;
  }
}
