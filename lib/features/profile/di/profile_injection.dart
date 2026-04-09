import 'package:trip_genie/core/manager/app_imports.dart';

void profileInjection() {
  if (!getIt.isRegistered<Box<UserModel>>()) {
    getIt.registerLazySingleton<Box<UserModel>>(() => HiveHelper.user);
  }
  
  if (!getIt.isRegistered<AuthService>()) {
    getIt.registerLazySingleton<AuthService>(() => AuthService());
  }

  if (!getIt.isRegistered<CachedUserDatasource>()) {
    getIt.registerLazySingleton<CachedUserDatasource>(
      () => CachedUserHiveDatasource(getIt<Box<UserModel>>()),
    );
  }

  if (!getIt.isRegistered<AuthRepo>()) {
    getIt.registerLazySingleton<AuthRepo>(
      () => AuthRepoImpl(
        authService: getIt<AuthService>(),
        userDatasource: getIt<CachedUserDatasource>(),
      ),
    );
  }

  getIt.registerFactory<UserCubit>(() => UserCubit(getIt()));
}
