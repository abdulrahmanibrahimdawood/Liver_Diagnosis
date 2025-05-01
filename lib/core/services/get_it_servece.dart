import 'package:get_it/get_it.dart';
import 'package:liver_diagnosis/core/services/firebase_auth_service.dart';
import 'package:liver_diagnosis/features/auth/data/repos/auth_repo.dart';
import 'package:liver_diagnosis/features/auth/data/repos/auth_repo_impl.dart';

final getIt = GetIt.instance;

void setupGetit() {
  getIt.registerSingleton<FirebaseAuthService>(FirebaseAuthService());
  getIt.registerSingleton<AuthRepo>(AuthRepoImpl(
    firebaseAuthService: getIt<FirebaseAuthService>(),
  ));
}
