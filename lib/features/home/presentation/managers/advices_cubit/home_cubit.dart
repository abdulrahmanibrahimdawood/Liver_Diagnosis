import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:liver_diagnosis/features/home/presentation/managers/advices_cubit/home_state.dart';
import 'package:liver_diagnosis/features/home/services/get_all_advices.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeInitial());

  final AllAdviceServices _advicesServices = AllAdviceServices();

  Future<void> fetchAdvices() async {
    emit(HomeLoading());
    try {
      final advices = await _advicesServices.getAllAdvices();
      if (advices.isEmpty) {
        emit(HomeFailure('No advices found.'));
      } else {
        emit(HomeSuccess(advices));
      }
    } catch (e) {
      if (e.toString().contains('No internet connection')) {
        emit(HomeFailure(
            'No internet connection. Please check your connection and try again.'));
      } else {
        emit(HomeFailure('Failed to load advices. Please try again later.'));
      }
    }
  }
}
