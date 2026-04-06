import 'package:trip_genie/core/manager/app_imports.dart';

void planInjection() {
  getIt.registerLazySingleton<Box<TripModel>>(() => HiveHelper.trips);

  getIt.registerLazySingleton<PlansService>(() => PlansService());
  getIt.registerLazySingleton<LocalDataServices>(
    () => HiveLocalDataServices(tripBox: getIt()),
  );

  getIt.registerLazySingleton<PlansRepo>(
    () => PlansRepoImpl(
      service: getIt<PlansService>(),
      localServices: getIt<LocalDataServices>(),
    ),
  );

  getIt.registerFactory<PlansCubit>(() => PlansCubit(getIt<PlansRepo>()));
}
