import 'package:e_commerce/features/auth/domain/entites/user_entity.dart';
import 'package:e_commerce/features/auth/data/repos/auth_repo.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'signin_state.dart';

class SigninCubit extends Cubit<SigninState> {
  SigninCubit(this.authRepo) : super(SigninInitial());
  final AuthRepo authRepo;
  Future<void> signIn(String email, String password) async {
    emit(SigninLoading());
    var result = await authRepo.signinWithEmailAndPassword(email, password);
    result.fold((failuer) => emit(SigninFailure(message: failuer.message)),
        (userEntity) => emit(SigninSuccess(userEntity: userEntity)));
  }

  Future<void> signInWithGoogle() async {
    emit(SigninLoading());
    var result = await authRepo.signinWithGoogle();
    result.fold((failuer) => emit(SigninFailure(message: failuer.message)),
        (userEntity) => emit(SigninSuccess(userEntity: userEntity)));
  }

  Future<void> signInWithFacebook() async {
    emit(SigninLoading());
    var result = await authRepo.signinWithFacebook();
    result.fold((failuer) => emit(SigninFailure(message: failuer.message)),
        (userEntity) => emit(SigninSuccess(userEntity: userEntity)));
  }

  Future<void> signInWithApple() async {
    emit(SigninLoading());
    var result = await authRepo.signinWithApple();
    result.fold((failuer) => emit(SigninFailure(message: failuer.message)),
        (userEntity) => emit(SigninSuccess(userEntity: userEntity)));
  }
}
