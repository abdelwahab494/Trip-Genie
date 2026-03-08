import 'package:dartz/dartz.dart';
import 'package:trip_genie/core/manager/app_imports.dart';

class AuthRepoImpl implements AuthRepo {
  final AuthService authService;

  AuthRepoImpl(this.authService);

  @override
  Future<Either<Failure, UserModel>> signIn({
    required String email,
    required String password,
  }) async {
    try {
      final response = await authService.signIn(
        email: email,
        password: password,
      );

      final UserModel model = UserModel(
        id: response.user!.id,
        email: response.user!.email,
        name: response.user!.userMetadata?["name"],
      );

      return Right(model);
    } catch (error) {
      return Left(SupabaseFailure.fromException(error));
    }
  }

  @override
  Future<Either<Failure, UserModel>> signUp({
    required String name,
    required String email,
    required String password,
  }) async {
    try {
      final response = await authService.signUp(
        name: name,
        email: email,
        password: password,
      );

      final UserModel model = UserModel(
        id: response.user!.id,
        email: response.user!.email,
        name: response.user!.userMetadata?["name"],
      );

      return Right(model);
    } catch (error) {
      return Left(SupabaseFailure.fromException(error));
    }
  }

  @override
  Future<Either<Failure, Unit>> signOut() async {
    try {
      await authService.signOut();
      return Right(unit);
    } catch (error) {
      return Left(SupabaseFailure.fromException(error));
    }
  }

  @override
  Either<Failure, UserModel> getUserData() {
    final user = authService.currentUser;

    if (user == null) {
      return Left(AuthFailure("No user logged in"));
    }

    final name =
        authService.getUserMetadataField(UserMetaDataEnum.name.name) ?? '';

    // if (name == null || name.isEmpty) {
    //   return Left(ValidationFailure("Name is required in metadata"));
    // }

    final model = UserModel(id: user.id, email: user.email, name: name);

    return Right(model);
  }

  @override
  Future<Either<Failure, Unit>> requestResetToken(String email) async {
    try {
      await authService.requestResetToken(email);
      return Right(unit);
    } catch (error) {
      return Left(SupabaseFailure.fromException(error));
    }
  }

  @override
  Future<Either<Failure, Unit>> verifyAndUpdatePassword({
    required String email,
    required String resetToken,
    required String password,
  }) async {
    try {
      await authService.verifyOTP(email: email, resetToken: resetToken);
      await authService.updateUserAttributes(password: password);
      return Right(unit);
    } catch (error) {
      return Left(SupabaseFailure.fromException(error));
    }
  }
}
