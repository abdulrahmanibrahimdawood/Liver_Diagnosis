import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:liver_diagnosis/features/home/data/repos/home_repo.dart';
import 'package:liver_diagnosis/features/home/data/repos/home_repo_impl.dart';
import 'package:liver_diagnosis/features/home/presentation/managers/advices_cubit/home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeInitial());

  final AdviceRepo _adviceRepo = AdviceRepoImpl();

  Future<void> fetchAdvices() async {
    emit(HomeLoading());
    try {
      final advices = await _adviceRepo.getAllAdvices();
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
