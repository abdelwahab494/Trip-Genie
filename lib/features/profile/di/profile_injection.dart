import 'package:trip_genie/core/manager/app_imports.dart';

void profileInjection() {
  if (!getIt.isRegistered<AuthService>()) {
    getIt.registerLazySingleton<AuthService>(() => AuthService());
  }

  if (!getIt.isRegistered<AuthRepo>()) {
    getIt.registerLazySingleton<AuthRepo>(() => AuthRepoImpl(getIt()));
  }

  getIt.registerFactory<UserCubit>(() => UserCubit(getIt()));
}
