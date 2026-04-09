import 'package:trip_genie/core/manager/app_imports.dart';

void travelTipsInjection() {
  getIt.registerLazySingleton<Box<TravelTipModel>>(() => HiveHelper.tips);

  getIt.registerLazySingleton<TravelTipsService>(() => TravelTipsService());
  getIt.registerLazySingleton<TravelTipsLocalDatasource>(
    () => TravelTipsHiveDatasource(getIt<Box<TravelTipModel>>()),
  );

  getIt.registerLazySingleton<TravelTipsRepo>(
    () => TravelTipsRepoImpl(
      localDatasource: getIt<TravelTipsLocalDatasource>(),
      tipsService: getIt<TravelTipsService>(),
    ),
  );

  getIt.registerLazySingleton<TravelTipsCubit>(
    () => TravelTipsCubit(
      travelTipsRepo: getIt<TravelTipsRepo>(),
    ),
  );
}
