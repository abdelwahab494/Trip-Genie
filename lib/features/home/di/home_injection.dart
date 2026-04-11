import 'package:trip_genie/core/manager/app_imports.dart';

void homeInjection() {
  if (!getIt.isRegistered<Box<UserModel>>()) {
    getIt.registerLazySingleton<Box<UserModel>>(() => HiveHelper.user);
  }

  if (!getIt.isRegistered<CachedUserDatasource>()) {
    getIt.registerLazySingleton<CachedUserDatasource>(
      () => CachedUserHiveDatasource(getIt<Box<UserModel>>()),
    );
  }

  getIt.registerLazySingleton<CitiesDatabaseService>(
    () => CitiesDatabaseService(),
  );

  getIt.registerLazySingleton<HomeRepo>(
    () => HomeRepoImpl(
      citiesDatabaseService: getIt<CitiesDatabaseService>(),
      localService: getIt<CachedUserDatasource>(),
    ),
  );

  getIt.registerLazySingleton<HomeCubit>(() => HomeCubit(getIt()));
}