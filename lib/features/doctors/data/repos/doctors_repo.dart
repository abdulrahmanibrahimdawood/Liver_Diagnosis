import 'package:liver_diagnosis/features/doctors/data/models/doctors_model.dart';

abstract class DoctorRepo {
  Future<List<DoctorsModel>> getAllDoctors({String? governorate});
}
