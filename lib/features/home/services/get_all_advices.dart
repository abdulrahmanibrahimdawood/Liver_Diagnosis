import 'package:liver_diagnosis/core/helper_functions/api.dart';
import 'package:liver_diagnosis/features/home/data/models/advice_model.dart';

class AllAdviceServices {
  Future<List<AdviceModel>> getAllAdvices() async {
    Map<String, dynamic> response = await Api().get(
      url:
          'https://2fc9b7c9c94f.ngrok-free.app/projectq-main/project/advice/advice.php',
      token: null,
    );

    List<dynamic> data = response['data'];
    List<AdviceModel> adviceList =
        data.map((json) => AdviceModel.fromJson(json)).toList();

    return adviceList;
  }
}
