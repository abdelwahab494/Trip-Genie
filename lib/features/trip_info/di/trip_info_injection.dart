import 'package:trip_genie/core/manager/app_imports.dart';
import 'package:trip_genie/features/trip_info/data/repos/trip_info_repo_impl.dart';

void tripInfoInjection() {
  getIt.registerLazySingleton<TripInfoService>(() => TripInfoService());

  getIt.registerLazySingleton<TripInfoRepo>(() => TripInfoRepoImpl(getIt()));

  getIt.registerFactory<TripInfoCubit>(() => TripInfoCubit(getIt()));
}
