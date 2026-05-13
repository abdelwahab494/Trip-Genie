import 'package:trip_genie/core/manager/app_imports.dart';

@module
abstract class AppModule {
  @lazySingleton
  SupabaseClient get supabaseClient => Supabase.instance.client;

  @lazySingleton
  Box<UserModel> get userBox => HiveHelper.user;

  @lazySingleton
  Box<TravelTipModel> get travelTipsBox => HiveHelper.tips;

  @lazySingleton
  Box<TripModel> get tripBox => HiveHelper.trips;
}
