import 'dart:developer';
import 'package:dartz/dartz.dart';
import 'package:liver_diagnosis/core/errors/exceptions.dart';
import 'package:liver_diagnosis/core/errors/failuer.dart';
import 'package:liver_diagnosis/core/services/firebase_auth_service.dart';
import 'package:liver_diagnosis/features/auth/data/models/user_model.dart';
import 'package:liver_diagnosis/features/auth/data/repos/auth_repo.dart';
import 'package:liver_diagnosis/features/auth/domain/entites/user_entity.dart';

class AuthRepoImpl extends AuthRepo {
  final FirebaseAuthService firebaseAuthService;

  AuthRepoImpl({required this.firebaseAuthService});
  @override
  Future<Either<Failure, UserEntity>> createUserWithEmailAndPassword(
      String email, String password, String name) async {
    try {
      var user = await firebaseAuthService.createUserWithEmailAndPassword(
          email: email, password: password);

      return right(UserModel.fromFirebaseUser(user));
    } on CustomException catch (e) {
      log('CustomException: ${e.message}');
      return left(ServerFailure(e.message));
    } catch (e) {
      log('Exception in createUserWithEmailAndPassword: ${e.toString()}');
      return left(ServerFailure('An unexpected error occurred.'));
    }
  }

  @override
  Future<Either<Failure, UserEntity>> signinWithEmailAndPassword(
      String email, String password) async {
    try {
      var user = await firebaseAuthService.signInWithEmailAndPassword(
          email: email, password: password);

      return right(UserModel.fromFirebaseUser(user));
    } on CustomException catch (e) {
      log('CustomException: ${e.message}');
      return left(ServerFailure(e.message));
    } catch (e) {
      log('Exception in signinWithEmailAndPassword: ${e.toString()}');
      return left(ServerFailure('An unexpected error occurred.'));
    }
  }

  @override
  Future<Either<Failure, UserEntity>> signinWithGoogle() async {
    try {
      var user = await firebaseAuthService.signInWithGoogle();
      return right(
        UserModel.fromFirebaseUser(user),
      );
    } on CustomException catch (e) {
      return left(
        ServerFailure(e.message),
      );
    } catch (e) {
      log('Exception in AuthRepoImpl.createUserWithEmailAndPassword ${e.toString()}');
      return left(
        ServerFailure('An error occured. Please try again later. '),
      );
    }
  }

  @override
  Future<Either<Failure, UserEntity>> signinWithFacebook() async {
    try {
      var user = await firebaseAuthService.signInWithFacebook();
      return right(
        UserModel.fromFirebaseUser(user),
      );
    } catch (e) {
      log('Exception in AuthRepoImpl.createUserWithEmailAndPassword ${e.toString()}');
      return left(
        ServerFailure('An error occured. Please try again later.'),
      );
    }
  }

  @override
  Future<Either<Failure, UserEntity>> signinWithApple() async {
    try {
      var user = await firebaseAuthService.signInWithApple();
      return right(
        UserModel.fromFirebaseUser(user),
      );
    } catch (e) {
      log('Exception in AuthRepoImpl.createUserWithEmailAndPassword ${e.toString()}');
      return left(
        ServerFailure('An error occured. Please try again later.'),
      );
    }
  }
}
