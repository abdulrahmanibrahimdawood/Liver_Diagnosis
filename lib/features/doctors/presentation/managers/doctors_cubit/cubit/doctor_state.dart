part of 'doctor_cubit.dart';

abstract class DoctorState {}

class DoctorInitial extends DoctorState {}

class DoctorLoading extends DoctorState {}

class DoctorSuccess extends DoctorState {
  final List<DoctorsModel> doctors;
  DoctorSuccess(this.doctors);
}

class DoctorFailure extends DoctorState {
  final String errMessage;
  DoctorFailure(this.errMessage);
}
