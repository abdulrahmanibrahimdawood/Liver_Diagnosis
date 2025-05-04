import 'package:liver_diagnosis/core/helper_functions/api.dart';
import 'package:liver_diagnosis/features/checkout/data/models/advice_model.dart';

class AllAdviceServices {
  Future<List<AdviceModel>> getAllAdvices() async {
    Map<String, dynamic> response = await Api().get(
      url:
          'http://da3d-197-53-37-64.ngrok-free.app//projectq-main/project/advice/advice.php',
      token: null,
    );

    List<dynamic> data = response['data'];
    List<AdviceModel> adviceList =
        data.map((json) => AdviceModel.fromJson(json)).toList();

    return adviceList;
  }
}
