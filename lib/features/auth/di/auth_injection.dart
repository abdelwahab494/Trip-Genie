import 'package:trip_genie/features/auth/presentation/cubit/auth_cubit.dart';
import 'package:trip_genie/core/manager/app_imports.dart';

void authInjection() {
  if (!getIt.isRegistered<Box<UserModel>>()) {
    getIt.registerLazySingleton<Box<UserModel>>(() => HiveHelper.user);
  }

  if (!getIt.isRegistered<SupabaseClient>()) {
    getIt.registerLazySingleton<SupabaseClient>(() => Supabase.instance.client);
  }

  if (!getIt.isRegistered<AuthService>()) {
    getIt.registerLazySingleton<AuthService>(() => AuthService(getIt<SupabaseClient>()));
  }

  if (!getIt.isRegistered<CachedUserDatasource>()) {
    getIt.registerLazySingleton<CachedUserDatasource>(
      () => CachedUserHiveDatasource(getIt<Box<UserModel>>()),
    );
  }

  if (!getIt.isRegistered<AuthRepo>()) {
    getIt.registerLazySingleton<AuthRepo>(
      () => AuthRepoImpl(
        profileService: getIt<ProfileService>(),
        authService: getIt<AuthService>(),
        userDatasource: getIt<CachedUserDatasource>(),
      ),
    );
  }

  if (!getIt.isRegistered<AuthCubit>()) {
    getIt.registerFactory<AuthCubit>(() => AuthCubit(getIt()));
  }
}
