import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:e_commerce/features/home/cubit/cubit/home_state.dart';
import 'package:e_commerce/features/home/services/get_all_advices.dart';

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
