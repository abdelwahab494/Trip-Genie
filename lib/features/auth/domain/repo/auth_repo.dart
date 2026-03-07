import 'package:dartz/dartz.dart';
import 'package:trip_genie/core/manager/app_imports.dart';

abstract class AuthRepo {
  Future<Either<Failure, AuthResponse>> signIn({
    required String email,
    required String password,
  });

  Future<Either<Failure, AuthResponse>> signUp({
    required String name,
    required String email,
    required String password,
  });

  Future<Either<Failure, Unit>> signOut();

  Either<Failure, UserModel>  getUserData();
}
