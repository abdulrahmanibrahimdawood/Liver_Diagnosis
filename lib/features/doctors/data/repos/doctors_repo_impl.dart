import 'package:liver_diagnosis/core/helper_functions/api.dart';
import 'package:liver_diagnosis/features/doctors/data/models/doctors_model.dart';
import 'package:liver_diagnosis/features/doctors/data/repos/doctors_repo.dart';

class DoctorRepoImpl implements DoctorRepo {
  @override
  Future<List<DoctorsModel>> getAllDoctors({String? governorate}) async {
    String url =
        'https://2fc9b7c9c94f.ngrok-free.app/projectq-main/project/doc/doctor_api.php';

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
