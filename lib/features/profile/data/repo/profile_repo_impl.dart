import 'dart:io';
import 'package:dartz/dartz.dart';
import 'package:trip_genie/core/manager/app_imports.dart';

@LazySingleton(as: ProfileRepo, env: [InjectionEnv.dev])
class ProfileRepoImpl implements ProfileRepo {
  final ProfileService profileService;

  ProfileRepoImpl(this.profileService);

  @override
  Future<Either<Failure, UserModel>> getUserProfile() async {
    try {
      final data = CachedUserHiveDatasource(
        HiveHelper.user,
      ).getCachedUser();
      if (data == null) return const Left(ProfileFailure("Profile not found"));
      //   final id = data[SupabaseHelper.profileIdColumn];
      if (id.toString().isEmpty) {
        return const Left(ProfileFailure("Invalid user data"));
      }

      return Right(data);
    } catch (e) {
      return Left(SupabaseFailure.fromException(e));
    }
  }

  @override
  Future<Either<Failure, Unit>> updateUserProfile(UserModel user) async {
    try {
      await profileService.updateUserProfile(user);
      final updatedData = await profileService.getProfile();
      final freshUser = UserModel.fromMap(updatedData!);
      await getIt<CachedUserDatasource>().cacheUser(freshUser);
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

      return Right(UserModel.fromMap(updatedData));
    } catch (e) {
      return Left(SupabaseFailure.fromException(e));
    }
  }
}
