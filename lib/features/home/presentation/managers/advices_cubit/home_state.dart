import 'package:liver_diagnosis/features/checkout/data/models/advice_model.dart';

abstract class HomeState {}

class HomeInitial extends HomeState {}

class HomeLoading extends HomeState {}

class HomeSuccess extends HomeState {
  final List<AdviceModel> advices;
  HomeSuccess(this.advices);
}

class HomeFailure extends HomeState {
  final String errMessage;
  HomeFailure(this.errMessage);
}
