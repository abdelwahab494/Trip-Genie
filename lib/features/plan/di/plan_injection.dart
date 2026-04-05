import 'package:trip_genie/core/manager/app_imports.dart';

void planInjection() {
  getIt.registerFactory<PlansCubit>(() => PlansCubit(getIt<PlansRepo>()));

  getIt.registerLazySingleton<PlansRepo>(
    () => PlansRepoImpl(getIt<PlansService>()),
  );

  getIt.registerLazySingleton<PlansService>(() => PlansService());
}
