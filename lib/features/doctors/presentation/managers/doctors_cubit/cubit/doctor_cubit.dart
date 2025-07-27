import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:liver_diagnosis/features/doctors/data/models/doctors_model.dart';
import 'package:liver_diagnosis/features/doctors/data/repos/doctors_repo.dart';
import 'package:liver_diagnosis/features/doctors/data/repos/doctors_repo_impl.dart';

part 'doctor_state.dart';

class DoctorCubit extends Cubit<DoctorState> {
  DoctorCubit() : super(DoctorInitial());

  final DoctorRepo _doctorRepo = DoctorRepoImpl();

  Future<void> fetchDoctors({String? governorate}) async {
    emit(DoctorLoading());
    try {
      final doctors = await _doctorRepo.getAllDoctors(governorate: governorate);
      if (doctors.isEmpty) {
        emit(DoctorFailure('No doctors found.'));
      } else {
        emit(DoctorSuccess(doctors));
      }
    } catch (e) {
      if (e.toString().contains('No internet connection')) {
        emit(DoctorFailure(
            'No internet connection. Please check your connection and try again.'));
      } else {
        emit(DoctorFailure('Failed to load doctors. Please try again later.'));
      }
    }
  }
}
