import 'package:dartz/dartz.dart';
import 'package:trip_genie/core/manager/app_imports.dart';

abstract class AuthRepo {
  Future<Either<Failure, UserModel>> signIn({
    required String email,
    required String password,
  });

  Future<Either<Failure, UserModel>> signUp({
    required String name,
    required String email,
    required String password,
  });

  Future<Either<Failure, Unit>> signOut();

  Either<Failure, UserModel> getUserData();

  Future<Either<Failure, Unit>> requestResetToken(String email);

  Future<Either<Failure, Unit>> verifyAndUpdatePassword({
    required String email,
    required String resetToken,
    required String password,
  });
}
