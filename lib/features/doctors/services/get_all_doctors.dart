import 'package:liver_diagnosis/core/helper_functions/api.dart';
import 'package:liver_diagnosis/features/checkout/data/models/doctors_model.dart';

class AllDoctorsServices {
  Future<List<DoctorsModel>> getAllDoctors({String? governorate}) async {
    String url =
        'https://da3d-197-53-37-64.ngrok-free.app/projectq-main/project/doc/doctor_api.php';

    if (governorate != null && governorate.trim().isNotEmpty) {
      url += '?governorate=${Uri.encodeComponent(governorate.trim())}';
    }

    Map<String, dynamic> response = await Api().get(
      url: url,
      token: null,
    );

    List<dynamic> data = response['data'];
    List<DoctorsModel> doctorsList =
        data.map((json) => DoctorsModel.fromJson(json)).toList();

    return doctorsList;
  }
}
