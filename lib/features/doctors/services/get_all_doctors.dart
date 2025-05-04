import 'package:liver_diagnosis/core/helper_functions/api.dart';
import 'package:liver_diagnosis/features/checkout/data/models/doctors_model.dart';

class AllDoctorsServices {
  Future<List<DoctorsModel>> getAllDoctors() async {
    Map<String, dynamic> response = await Api().get(
      url:
          'http://da3d-197-53-37-64.ngrok-free.app//projectq-main/project/doc/doctor_api.php',
      token: null,
    );

    List<dynamic> data = response['data'];
    List<DoctorsModel> doctorsList =
        data.map((json) => DoctorsModel.fromJson(json)).toList();

    return doctorsList;
  }
}
