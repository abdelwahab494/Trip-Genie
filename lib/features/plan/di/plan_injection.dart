import 'package:trip_genie/core/manager/app_imports.dart';

void planInjection() {
  if (!getIt.isRegistered<Box<TripModel>>()) {
    getIt.registerLazySingleton<Box<TripModel>>(() => HiveHelper.trips);
  }

  getIt.registerLazySingleton<PlansService>(() => PlansService());
  if (!getIt.isRegistered<TripPlanDatasource>()) {
    getIt.registerLazySingleton<TripPlanDatasource>(
      () => HiveTripPlanDatasource(tripBox: getIt()),
    );
  }

  getIt.registerLazySingleton<PlansRepo>(
    () => PlansRepoImpl(
      service: getIt<PlansService>(),
      localServices: getIt<TripPlanDatasource>(),
    ),
  );

  getIt.registerFactory<PlansCubit>(() => PlansCubit(getIt<PlansRepo>()));
}
