// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format width=80

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;

import '../../features/auth/data/repo/auth_repo_impl.dart' as _i984;
import '../../features/auth/data/services/auth_service.dart' as _i449;
import '../../features/auth/presentation/cubit/auth_cubit.dart' as _i117;
import '../../features/home/data/repo/home_repo_impl.dart' as _i1024;
import '../../features/home/data/service/cities_database_service.dart' as _i187;
import '../../features/home/presentation/cubit/home_cubit.dart' as _i9;
import '../../features/plan/data/repos/plans_repo_impl.dart' as _i174;
import '../../features/plan/data/services/plans_service.dart' as _i733;
import '../../features/plan/presentation/cubit/plans_cubit.dart' as _i1034;
import '../../features/profile/data/repo/profile_repo_impl.dart' as _i256;
import '../../features/profile/data/services/profile_service.dart' as _i510;
import '../../features/profile/presentation/cubits/profile_cubit/profile_cubit.dart'
    as _i26;
import '../../features/saves/data/repos/saves_repo_impl.dart' as _i406;
import '../../features/saves/presentation/cubit/saves_cubit.dart' as _i674;
import '../../features/travel_tips/data/repo/travel_tips_repo_imp.dart'
    as _i126;
import '../../features/travel_tips/data/service/travel_tips_local_datasource.dart'
    as _i446;
import '../../features/travel_tips/data/service/travel_trip_service.dart'
    as _i831;
import '../../features/travel_tips/presentation/cubit/travel_tips_cubit.dart'
    as _i751;
import '../../features/trip_info/data/repos/trip_info_repo_impl.dart' as _i717;
import '../../features/trip_info/data/services/trip_info_service.dart' as _i309;
import '../../features/trip_info/presentation/cubit/trip_info_cubit.dart'
    as _i225;
import '../manager/app_imports.dart' as _i1038;
import '../shared/datasources/cached_user_datasource.dart' as _i717;
import '../shared/datasources/trip_plan_datasource.dart' as _i625;
import 'modules/app_module.dart' as _i349;

const String _dev = 'dev';

extension GetItInjectableX on _i174.GetIt {
  // initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(this, environment, environmentFilter);
    final appModule = _$AppModule();
    gh.lazySingleton<_i1038.SupabaseClient>(() => appModule.supabaseClient);
    gh.lazySingleton<_i1038.Box<_i1038.UserModel>>(() => appModule.userBox);
    gh.lazySingleton<_i1038.Box<_i1038.TravelTipModel>>(
      () => appModule.travelTipsBox,
    );
    gh.lazySingleton<_i1038.Box<_i1038.TripModel>>(() => appModule.tripBox);
    gh.lazySingleton<_i187.CitiesDatabaseService>(
      () => _i187.CitiesDatabaseServiceImpl(),
      registerFor: {_dev},
    );
    gh.lazySingleton<_i446.TravelTipsLocalDatasource>(
      () => _i446.TravelTipsHiveDatasource(
        gh<_i1038.Box<_i1038.TravelTipModel>>(),
      ),
      registerFor: {_dev},
    );
    gh.lazySingleton<_i831.TravelTipsService>(
      () => _i831.TravelTipsServiceImpl(),
      registerFor: {_dev},
    );
    gh.lazySingleton<_i625.TripPlanDatasource>(
      () => _i625.HiveTripPlanDatasource(
        tripBox: gh<_i1038.Box<_i1038.TripModel>>(),
      ),
      registerFor: {_dev},
    );
    gh.lazySingleton<_i733.PlansService>(
      () => _i733.PlansServiceImpl(),
      registerFor: {_dev},
    );
    gh.lazySingleton<_i1038.SavesRepo>(
      () => _i406.SavesRepoImpl(gh<_i1038.TripPlanDatasource>()),
      registerFor: {_dev},
    );
    gh.lazySingleton<_i1038.TravelTipsRepo>(
      () => _i126.TravelTipsRepoImpl(
        tipsService: gh<_i1038.TravelTipsService>(),
        localDatasource: gh<_i1038.TravelTipsLocalDatasource>(),
      ),
      registerFor: {_dev},
    );
    gh.lazySingleton<_i309.TripInfoService>(
      () => _i309.TripInfoServiceImpl(),
      registerFor: {_dev},
    );
    gh.factory<_i751.TravelTipsCubit>(
      () => _i751.TravelTipsCubit(travelTipsRepo: gh<_i1038.TravelTipsRepo>()),
    );
    gh.lazySingleton<_i717.CachedUserDatasource>(
      () => _i717.CachedUserHiveDatasource(gh<_i1038.Box<_i1038.UserModel>>()),
      registerFor: {_dev},
    );
    gh.lazySingleton<_i449.AuthService>(
      () => _i449.AuthServiceImpl(gh<_i1038.SupabaseClient>()),
      registerFor: {_dev},
    );
    gh.factory<_i674.SavesCubit>(
      () => _i674.SavesCubit(gh<_i1038.SavesRepo>()),
    );
    gh.lazySingleton<_i510.ProfileService>(
      () => _i510.ProfileServiceImpl(
        authService: gh<_i1038.AuthService>(),
        supabase: gh<_i1038.SupabaseClient>(),
      ),
      registerFor: {_dev},
    );
    gh.lazySingleton<_i1038.PlansRepo>(
      () => _i174.PlansRepoImpl(
        service: gh<_i1038.PlansService>(),
        localServices: gh<_i1038.TripPlanDatasource>(),
      ),
      registerFor: {_dev},
    );
    gh.factory<_i1034.PlansCubit>(
      () => _i1034.PlansCubit(gh<_i1038.PlansRepo>()),
    );
    gh.lazySingleton<_i1038.HomeRepo>(
      () => _i1024.HomeRepoImpl(
        citiesDatabaseService: gh<_i1038.CitiesDatabaseService>(),
        localService: gh<_i1038.CachedUserDatasource>(),
      ),
      registerFor: {_dev},
    );
    gh.lazySingleton<_i1038.ProfileRepo>(
      () => _i256.ProfileRepoImpl(gh<_i1038.ProfileService>()),
      registerFor: {_dev},
    );
    gh.lazySingleton<_i1038.TripInfoRepo>(
      () => _i717.TripInfoRepoImpl(gh<_i1038.TripInfoService>()),
      registerFor: {_dev},
    );
    gh.factory<_i26.ProfileCubit>(
      () => _i26.ProfileCubit(gh<_i1038.ProfileRepo>()),
    );
    gh.factory<_i9.HomeCubit>(() => _i9.HomeCubit(gh<_i1038.HomeRepo>()));
    gh.lazySingleton<_i1038.AuthRepo>(
      () => _i984.AuthRepoImpl(
        authService: gh<_i1038.AuthService>(),
        userDatasource: gh<_i1038.CachedUserDatasource>(),
        profileService: gh<_i1038.ProfileService>(),
      ),
      registerFor: {_dev},
    );
    gh.factory<_i225.TripInfoCubit>(
      () => _i225.TripInfoCubit(gh<_i1038.TripInfoRepo>()),
    );
    gh.factory<_i117.AuthCubit>(() => _i117.AuthCubit(gh<_i1038.AuthRepo>()));
    return this;
  }
}

class _$AppModule extends _i349.AppModule {}
