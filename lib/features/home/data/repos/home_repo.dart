import 'package:liver_diagnosis/features/home/data/models/advice_model.dart';

abstract class AdviceRepo {
  Future<List<AdviceModel>> getAllAdvices();
}
