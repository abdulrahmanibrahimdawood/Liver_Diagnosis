import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:liver_diagnosis/features/checkout/data/models/doctors_model.dart';
import 'package:liver_diagnosis/features/doctors/services/get_all_doctors.dart';

part 'doctor_state.dart';

class DoctorCubit extends Cubit<DoctorState> {
  DoctorCubit() : super(DoctorInitial());

  final AllDoctorsServices _doctorsServices = AllDoctorsServices();

  Future<void> fetchDoctors() async {
    emit(DoctorLoading());
    try {
      final doctors = await _doctorsServices.getAllDoctors();
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
