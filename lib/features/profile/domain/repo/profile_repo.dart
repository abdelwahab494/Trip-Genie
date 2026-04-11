import 'dart:io';
import 'package:dartz/dartz.dart';
import 'package:trip_genie/core/manager/app_imports.dart';

abstract class ProfileRepo {
  Future<Either<Failure, UserModel>> getUserProfile();

  Future<Either<Failure, Unit>> updateUserProfile(UserModel user);
  
  Future<Either<Failure, UserModel>> updateProfileImage(
    File imageFile,
    String userId,
  );
}
