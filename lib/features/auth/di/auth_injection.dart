import 'package:trip_genie/features/auth/presentation/cubit/auth_cubit.dart';
import 'package:trip_genie/core/manager/app_imports.dart';

void authInjection() {
  if (!getIt.isRegistered<AuthService>()) {
    getIt.registerLazySingleton<AuthService>(() => AuthService());
  }

  if (!getIt.isRegistered<AuthRepo>()) {
    getIt.registerLazySingleton<AuthRepo>(() => AuthRepoImpl(getIt()));
  }

  if (!getIt.isRegistered<AuthCubit>()) {
    getIt.registerFactory<AuthCubit>(() => AuthCubit(getIt()));
  }
}
