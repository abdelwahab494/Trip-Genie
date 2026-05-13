import 'package:trip_genie/core/manager/app_imports.dart';
import 'package:trip_genie/features/profile/data/repo/profile_repo_impl.dart';

void profileInjection() {
  if (!getIt.isRegistered<Box<UserModel>>()) {
    getIt.registerLazySingleton<Box<UserModel>>(() => HiveHelper.user);
  }

  if (!getIt.isRegistered<SupabaseClient>()) {
    getIt.registerLazySingleton<SupabaseClient>(() => Supabase.instance.client);
  }

  if (!getIt.isRegistered<AuthService>()) {
    getIt.registerLazySingleton<AuthService>(
      () => AuthService(getIt<SupabaseClient>()),
    );
  }

  if (!getIt.isRegistered<CachedUserDatasource>()) {
    getIt.registerLazySingleton<CachedUserDatasource>(
      () => CachedUserHiveDatasource(getIt<Box<UserModel>>()),
    );
  }

  getIt.registerLazySingleton<ProfileService>(
    () => ProfileService(getIt<AuthService>()),
  );

  getIt.registerLazySingleton<ProfileRepo>(
    () => ProfileRepoImpl(getIt<ProfileService>()),
  );

  getIt.registerFactory<ProfileCubit>(() => ProfileCubit(getIt<ProfileRepo>()));
}
