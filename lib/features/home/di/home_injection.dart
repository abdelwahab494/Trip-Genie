import 'package:trip_genie/core/manager/app_imports.dart';

void homeInjection() {
  getIt.registerLazySingleton<CitiesDatabaseService>(
    () => CitiesDatabaseService(),
  );

  getIt.registerLazySingleton<HomeRepo>(() => HomeRepoImpl(getIt()));

  getIt.registerLazySingleton<HomeCubit>(() => HomeCubit(getIt()));
}
