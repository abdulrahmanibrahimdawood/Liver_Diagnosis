import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:liver_diagnosis/features/home/presentation/managers/logout_cubit/logout_state.dart';

class LogoutCubit extends Cubit<LogoutState> {
  LogoutCubit() : super(LogoutInitial());

  Future<void> signOut() async {
    emit(LogoutLoading());
    try {
      await FirebaseAuth.instance.signOut();
      emit(LogoutSuccess());
    } catch (e) {
      emit(LogoutFailure('An error occurred while logging out.'));
    }
  }
}
