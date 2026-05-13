import 'package:trip_genie/core/manager/app_imports.dart';

sealed class TripInfoService {
  Future<List<Map<String, dynamic>>> getPlacesForCity(String cityId);
}

@LazySingleton(as: TripInfoService, env: [InjectionEnv.dev])
class TripInfoServiceImpl implements TripInfoService {
  @override
  Future<List<Map<String, dynamic>>> getPlacesForCity(String cityId) async {
    final response = await SupabaseHelper.supabaseClient
        .from(SupabaseHelper.placesTable)
        .select()
        .eq(SupabaseHelper.placesCityIdColumn, cityId);
    return response;
  }
}
