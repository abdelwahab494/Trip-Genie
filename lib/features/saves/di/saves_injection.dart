import 'package:trip_genie/core/manager/app_imports.dart';

void savesInjection() {
  if (!getIt.isRegistered<Box<TripModel>>()) {
    getIt.registerLazySingleton<Box<TripModel>>(() => HiveHelper.trips);
  }

  if (!getIt.isRegistered<TripPlanDatasource>()) {
    getIt.registerLazySingleton<TripPlanDatasource>(
      () => HiveTripPlanDatasource(tripBox: getIt()),
    );
  }

  getIt.registerLazySingleton<SavesRepo>(() => SavesRepoImpl(getIt()));

  getIt.registerFactory<SavesCubit>(() => SavesCubit(getIt()));
}
