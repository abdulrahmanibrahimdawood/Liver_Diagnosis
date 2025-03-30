import 'package:e_commerce/core/helper_functions/api.dart';
import 'package:e_commerce/features/checkout/data/models/doctors_model.dart';

class AllDoctorsServices {
  Future<List<DoctorsModel>> getAllDoctors() async {
    Map<String, dynamic> response = await Api().get(
      url:
          'https://8ac7-197-53-6-118.ngrok-free.app/project/doc/doctor_api.php',
      token: null,
    );

    List<dynamic> data = response['data'];
    List<DoctorsModel> doctorsList =
        data.map((json) => DoctorsModel.fromJson(json)).toList();

    return doctorsList;
  }
}
