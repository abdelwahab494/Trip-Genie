import 'package:dartz/dartz.dart';
import 'package:trip_genie/core/manager/app_imports.dart';

class AuthRepoImpl implements AuthRepo {
  final AuthService authService;

  AuthRepoImpl(this.authService);

  @override
  Future<Either<Failure, AuthResponse>> signIn({
    required String email,
    required String password,
  }) async {
    try {
      final response = await authService.signIn(
        email: email,
        password: password,
      );

      return Right(response);
    } catch (error) {
      return Left(SupabaseFailure.fromException(error));
    }
  }

  @override
  Future<Either<Failure, AuthResponse>> signUp({
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

      return Right(response);
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
}
