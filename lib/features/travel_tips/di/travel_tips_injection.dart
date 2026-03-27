import 'package:trip_genie/core/manager/app_imports.dart';

void travelTipsInjection() {
  getIt.registerLazySingleton<TravelTipsService>(() => TravelTipsService());

  getIt.registerLazySingleton<TravelTipsRepo>(
    () => TravelTipsRepoImpl(getIt()),
  );

  getIt.registerLazySingleton<TravelTipsCubit>(() => TravelTipsCubit(getIt()));
}