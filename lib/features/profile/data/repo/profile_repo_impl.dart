import 'dart:io';
import 'package:dartz/dartz.dart';
import 'package:trip_genie/core/manager/app_imports.dart';

class ProfileRepoImpl implements ProfileRepo {
  final ProfileService profileService;

  ProfileRepoImpl(this.profileService);

  @override
  Future<Either<Failure, UserModel>> getUserProfile() async {
    try {
      final data = await profileService.getProfile();
      if (data == null) return const Left(ProfileFailure("Profile not found"));
      final id = data[SupabaseHelper.profileIdColumn];
      if (id == null || id.toString().isEmpty) {
        return const Left(ProfileFailure("Invalid user data"));
      }

      final user = UserModel.fromJson(data);

      return Right(user);
    } catch (e) {
      return Left(SupabaseFailure.fromException(e));
    }
  }

  @override
  Future<Either<Failure, Unit>> updateUserProfile(UserModel user) async {
    try {
      await profileService.updateUserProfile(user);
      return Right(unit);
    } catch (e) {
      return Left(SupabaseFailure.fromException(e));
    }
  }

  // inside ProfileRepoImpl

  @override
  Future<Either<Failure, UserModel>> updateProfileImage(
    File imageFile,
    String userId,
  ) async {
    try {
      await profileService.uploadAndUpdateProfileImage(
        file: imageFile,
        userId: userId,
      );

      final updatedData = await profileService.getProfile();
      if (updatedData == null) {
        return const Left(ProfileFailure("Failed to sync profile"));
      }

      return Right(UserModel.fromJson(updatedData));
    } catch (e) {
      return Left(SupabaseFailure.fromException(e));
    }
  }
}
